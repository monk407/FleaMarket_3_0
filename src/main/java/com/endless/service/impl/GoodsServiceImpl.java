package com.endless.service.impl;

import com.endless.dao.*;
import com.endless.pojo.Goods;
import com.endless.pojo.Order;
import com.endless.pojo.OrderItem;
import com.endless.pojo.User;
import com.endless.service.GoodsService;
import com.endless.utils.PriceUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.*;

@Service
public class GoodsServiceImpl implements GoodsService {

    @Resource
    private UserDao userDao;
    @Resource
    private OrderDao orderDao;
    @Resource
    private OrderItemDao orderItemDao;
    @Resource
    private GoodsDao goodsDao;
    @Resource
    private TypeDao typeDao;

    @Override
    public List<Goods> recommendGoodsList() {

        //查询goods表行数
        int totalGoodsCount = goodsDao.totalGoodsCount();

        //随机生成六条goods信息
        Random random = new Random();
        int count = random.nextInt(totalGoodsCount-6)+1;
//        System.out.println(count);
        List<Goods> recommendGoodsList = goodsDao.recommendGoodsList(count);
//        System.out.println(recommendGoodsList);
        return recommendGoodsList;
    }

    @Override
    public Goods findGood(int id) {

        Goods good = goodsDao.findGood(id);

        return good;
    }

    @Override
    public int findGoodStock(int id) {

        int goodStock = goodsDao.findGoodStock(id);

        return goodStock;
    }

    @Override
    public List<Goods> findGoodsByType(String type) {
        List<Goods> goodsList = null;
        if("all".equals(type)){
            goodsList = goodsDao.findAllGoods();
            System.out.println(goodsList);
            return goodsList;
        }
        else {
            int type_id = Integer.parseInt(type);
            goodsList = goodsDao.findGoodsByType(type_id);
            return goodsList;
        }
    }

    @Override
    public PageInfo<Goods> findGoodsByTypePage(Integer pageNum,String typeID) {
        List<Goods> goodsList = null;
        if("all".equals(typeID)){
            //        开启分页功能
            PageHelper.startPage(pageNum, 9);
            goodsList = goodsDao.findAllGoods();
            System.out.println(goodsList);
//        获取分页相关的数据
            PageInfo<Goods> page  = new PageInfo<>(goodsList, 5);
            return page;
        }
        else {
            int type_id = Integer.parseInt(typeID);
            //        开启分页功能
            PageHelper.startPage(pageNum, 9);
            //        查询所有的商品信息
            goodsList = goodsDao.findGoodsByType(type_id);
            //        获取分页相关的数据
            PageInfo<Goods> page  = new PageInfo<>(goodsList, 5);
            return page;
        }
    }

    @Override
    public List<Goods> searchGoods(String searchGoodsName) {
        StringBuffer stringBuffer = new StringBuffer(searchGoodsName);
        stringBuffer.insert(0,"%");
        stringBuffer.append("%");
//        System.out.println(stringBuffer.toString());
        List<Goods> searchGoodsList = goodsDao.searchGoods(stringBuffer.toString());
//        System.out.println(searchGoodsList);
        return searchGoodsList;
    }



    @Override
    //读取表中有多少条数据
    public int selectGoodsColumn() {
        return goodsDao.selectGoodsColumn();
    }

    @Override
    public List<Goods> findAllGoods() {
        List<Goods> goods = goodsDao.SelectAllGoods();
        System.out.println("#####获取到的数据#######" + goods + "!!@@!#!@!$!@");
        return goods;
    }

    @Override
    public PageInfo<Goods> getGoodpage(Integer pageNum) {
//        开启分页功能
        PageHelper.startPage(pageNum, 4);
//        查询所有的商品信息
        List<Goods> goodsList = goodsDao.SelectAllGoods();
//        获取分页相关的数据
        PageInfo<Goods> page = new PageInfo<>(goodsList, 5);
        return page;
    }

    @Override
    public PageInfo<Goods> getGoodTypepage(Integer pageNum, int typeID) {
        //        开启分页功能
        PageHelper.startPage(pageNum, 4);
//        查询所有的商品信息
        List<Goods> goodsList = goodsDao.SelectAllTypeGoods(typeID);
//        获取分页相关的数据
        PageInfo<Goods> page  = new PageInfo<>(goodsList, 5);
        return page;

    }

    @Override
    public Boolean AdminDeleteGoodsByid(int goodid) {

//        判断在删除货物是否卖出，true表示卖出，false表示为卖出
        boolean goodSale = true;
//        判断货物中要卖的订单项里面的订单状态是否全为3，true表示全为3，false表示不全为3
        boolean goodOrderitemStatus = false;
//              根据goodid = orderitem.good_id 查询是否有orderitem
        List<OrderItem> orderItems = orderItemDao.SelectGoodidItem(goodid);
//        若货物有卖出去，则能查到该订单项
        if(orderItems.size() != 0){
            for (OrderItem orderItem:orderItems){
//                判断这些订单项是否都完成，order里面的status是否都是3
                if (orderItem.getOrder().getStatus() != 3){
//                    有订单未完成，则不可删除货物
                    return false;
                }
            }
            System.out.println("货物中的订单全部卖出去了！！！");
            goodOrderitemStatus = true;


        } else {
//            该货物没有卖出去，那么可以直接删除该货物；
            System.out.println("没有货物卖出去！！！！");
            goodSale = false;

        }
        if (goodOrderitemStatus == true){
            for (OrderItem orderItem:orderItems){
//            执行 将orderitem中的goodid改成1
//          修改这个订单项的good_id为1，表示已经下架。
                orderItemDao.Updategoodid(orderItem.getId());
            }
//           删除good
            int count = goodsDao.AdminDeleteGood(goodid);
            if (count != 0) {
                return true;
            } else return false;
        }else if (goodSale == false){
            //            删除good
            int count = goodsDao.AdminDeleteGood(goodid);
            if (count != 0) {
                return true;
            } else return false;
        }

        return false;
    }

    @Override
    public Order updateShopCart(Goods goods, Order order, int amount) {

        //order的itemMap中找出商品goods,
        OrderItem orderItem = order.getItemMap().get(goods.getId());
        //获取该orderitem未修改amount的值
        int beforeAmount = orderItem.getAmount();
        //修改orderitem的amount
        orderItem.setAmount(amount);

        //修改order的total和amount
        if(amount > beforeAmount){
            order.setAmount(order.getAmount()+(amount-beforeAmount));
            order.setTotal(PriceUtils.add(order.getTotal(),(amount-beforeAmount)*goods.getPrice()));
        }
        else if(amount < beforeAmount){
            order.setAmount(order.getAmount()-(beforeAmount-amount));
            order.setTotal(PriceUtils.subtract(order.getTotal(),(beforeAmount-amount)*goods.getPrice()));
        }

        return order;
    }

    @Override
    public List<Goods> AdminSearchGood(String searchValue) {
        List<Goods> goods = goodsDao.AdminSearchGood(searchValue);
        return goods;
    }

    @Override
    public Map subOrder(HttpSession session, String address, String name, String phone) {

        Map<String, List<Map<String, String>>> sortSelectGoodsMap = (Map<String, List<Map<String, String>>>) session.getAttribute("sortSelectGoodsMap");
        Map msgMap = new HashMap();
//        List<String> msgList = new LinkedList<>();


        sortSelectGoodsMap.forEach((k, v) -> {
            for (Map<String,String> goodMap:v){
                //购买商品的数量
                int gAmount = Integer.parseInt(goodMap.get("gAmount"));
                //数据库中该商品的库存。若库存不够，不能进行提交订单。
                int stock = goodsDao.findGoodStock(Integer.parseInt(goodMap.get("goodsid")));
                if (gAmount > stock){
                    System.out.println(goodsDao.findGood(Integer.parseInt(goodMap.get("goodsid"))).getName()+ "的库存不够！");
                    if(msgMap.containsKey("msgMap")){
                        List<String> list = (List<String>) msgMap.get("msgMap");
                        list.add(goodsDao.findGood(Integer.parseInt(goodMap.get("goodsid"))).getName()+ "的库存不够！");
                        msgMap.put("msgMap",list);
                    }
                    else {
                        List<String> list = new LinkedList<>();
                        list.add(goodsDao.findGood(Integer.parseInt(goodMap.get("goodsid"))).getName()+ "的库存不够！");
                        msgMap.put("msgMap",list);
                    }
                }
            }
        });

        //如果msgMap中没有key为"msgMap"的值，说明该订单所有的商品库存是足够的，可以提交订单
        if (!msgMap.containsKey("msgMap")){

            int orderUserId = ((User) session.getAttribute("user")).getId();
            Order o = (Order) session.getAttribute("order");
            Timestamp datetime = new Timestamp(new Date().getTime());

            sortSelectGoodsMap.forEach((k, v) -> {

                float orderTotal = 0;
                int orderAmount = 0;
                int status = 1;

                //获取order记录的total和amount
                for (Map<String,String> goodMap:v){
                    orderTotal = orderTotal + Float.parseFloat(goodMap.get("gTotal"));
                    orderAmount = orderAmount + Integer.parseInt(goodMap.get("gAmount"));
                }
                o.setTotal(o.getTotal()-orderTotal);
                o.setAmount(o.getAmount()-orderAmount);

                //order表插入一条记录
                int count1 = orderDao.addOrderByCart(orderTotal,orderAmount,status,name,phone,address,datetime,orderUserId);

                //orderitem表插入相关记录
                Map<Integer,OrderItem> itemMap = ((Order) session.getAttribute("order")).getItemMap();
                int newOrderId = orderDao.findNewOrderIdByBuyIdInCart(orderUserId);//获取买家id对应的最新一条order记录的id
                System.out.println("=====++++++++++++++++++++++"+newOrderId);
                for (Map<String,String> goodMap:v){
                    float oiPrice = Float.parseFloat(goodMap.get("gTotal"));
                    int oiAmount = Integer.parseInt(goodMap.get("gAmount"));
                    for (Integer key: itemMap.keySet()) {
                        if (key == Integer.parseInt(goodMap.get("goodsid"))){
                            int count2 = orderItemDao.addSubOrderOrderItem(oiPrice,oiAmount,key,newOrderId);//orderitem插入相关记录
                            //减库存
                            int oldStock = goodsDao.findGoodStock(key);
                            int r = goodsDao.subStockInCart(key,oldStock-oiAmount);
                            //清除购物车相对应的商品
                            o.getItemMap().remove(key);

                            break;
                        }
                    }
                }

            });

            session.removeAttribute("sortSelectGoodsMap");
            session.setAttribute("order",o);

            msgMap.put("msg","true");
            return msgMap;
        }
        else {
            msgMap.put("msg","false");
            return msgMap;
        }

    }

    @Override
    public PageInfo<Goods> GetMyGoodsPage(Integer pageNum,int userid) {
//        开启分页功能
        PageHelper.startPage(pageNum, 4);
//        查询所有的商品信息
        List<Goods> goodsList = goodsDao.SelectUseridGoods(userid);
//        获取分页相关的数据
        PageInfo<Goods> page = new PageInfo<>(goodsList, 5);
        return page;
    }

    @Override
    public List<Goods> hotGoodsList() {

        List<Goods> hotGoodsList = goodsDao.gethotGoodsList();

        return hotGoodsList;
    }
    @Override
    public Boolean DeleteMyGoodsByid(int goodid) {

//        判断在删除货物是否卖出，true表示卖出，false表示为卖出
        boolean goodSale = true;
//        判断货物中要卖的订单项里面的订单状态是否全为3，true表示全为3，false表示不全为3
        boolean goodOrderitemStatus = false;
//              根据goodid = orderitem.good_id 查询是否有orderitem
        List<OrderItem> orderItems = orderItemDao.SelectGoodidItem(goodid);
//        若货物有卖出去，则能查到该订单项
        if(orderItems.size() != 0){
            for (OrderItem orderItem:orderItems){
//                判断这些订单项是否都完成，order里面的status是否都是3
                if (orderItem.getOrder().getStatus() != 3){
//                    有订单未完成，则不可删除货物
                    return false;
                }
            }
            System.out.println("货物中的订单全部卖出去了！！！");
            goodOrderitemStatus = true;


        } else {
//            该货物没有卖出去，那么可以直接删除该货物；
            System.out.println("没有货物卖出去！！！！");
            goodSale = false;

        }
        if (goodOrderitemStatus == true){
            for (OrderItem orderItem:orderItems){
//            执行 将orderitem中的goodid改成1
//          修改这个订单项的good_id为1，表示已经下架。
                orderItemDao.Updategoodid(orderItem.getId());
            }
//           删除good
            int count = goodsDao.AdminDeleteGood(goodid);
            if (count != 0) {
                return true;
            } else return false;
        }else if (goodSale == false){
            //            删除good
            int count = goodsDao.AdminDeleteGood(goodid);
            if (count != 0) {
                return true;
            } else return false;
        }

        return false;
    }

    @Override
    public int modifyMyOrderGoodsStatus(int orderId) {

        int count = goodsDao.modifyMyOrderGoodsStatus(orderId);

        return count;
    }

    @Override
    public int modifyMyOrderGoodsStock(int orderId) {

        List<Goods> goodsList = goodsDao.findGoodStockByOrderId(orderId);
        List<OrderItem> orderItemList = orderItemDao.getMyBuyOrderItem(orderId);

        for (Goods goods : goodsList){
            for (OrderItem orderItem : orderItemList){

                if(orderItem.getGoods().getId() == goods.getId()){
                    int goodStock = goods.getStock()+orderItem.getAmount();
                    int count = goodsDao.modifyMyOrderGoodsStock(goodStock,goods.getId());
                }

            }
        }

        int count = orderItemDao.delMyBuyOrderItem(orderId);

        int count1 = orderDao.delMyBuyOrder(orderId);

        return 0;
    }

    @Override
    public int modifyMySellGoodsStock(int parseInt) {
        int count = goodsDao.modifyMySellGoodsStatus(parseInt);

        return count;
    }

    @Override
    public String insertNewGoods(String goodsName,String suffix ,float parseFloat, String goodsIntro, int parseInt, String type, int userId) {

        //查出目前goods表中最新的条记录的id
        int lateId = goodsDao.findLateGoodId();
        //查询type类型的id
        int type_id = typeDao.findTypeIdByName(type);
        //当前商品id
        int nowGoodsId = lateId + 1;
        //当前商品的图片所在位置
        String filename = "/picture/"+ String.valueOf(nowGoodsId) + "-1" +suffix;
        //goods插入商品记录
        int count = goodsDao.insertNewGoods(goodsName,filename,parseFloat,goodsIntro,parseInt,type_id,userId);

        return String.valueOf(nowGoodsId) + "-1" +suffix;
    }

    @Override
    public String editGoods(String goodsId, String goodsName, String suffix, float price, String goodsIntro, int stock, String type, int user) {

        //获取需要修改的商品
        Goods goods = goodsDao.findGood(Integer.parseInt(goodsId));
        //获取该商品图片名字
        String image = goods.getImage();
        //更换图片名字的后缀
        String imageName = image.substring(0, image.indexOf("."));
        goods.setImage(imageName+suffix);
        //查询type类型的id
        int type_id = typeDao.findTypeIdByName(type);
        //修改商品信息
        int count = goodsDao.editGoods(Integer.parseInt(goodsId),goodsName,goods.getImage(),price,goodsIntro,stock,type_id,user);

        String[] tmp = imageName.split("/");


        return tmp[2];
    }


}
