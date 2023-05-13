package com.endless.service.impl;

import com.endless.dao.GoodsDao;
import com.endless.dao.OrderDao;
import com.endless.dao.OrderItemDao;
import com.endless.pojo.Order;
import com.endless.pojo.OrderItem;
import com.endless.service.OrderService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class OrderServiceImpl implements OrderService {
    @Resource
    private OrderDao orderDao;
    @Resource
    private OrderItemDao orderItemDao;
    @Resource
    private GoodsDao goodsDao;

    @Override
    public int selectOrderColumn() {
         return orderDao.selectOrderColumn();
    }

    @Override
    public List<Order> selectAllOrder() {
        List<Order> orderList = orderDao.selectAllOrder();
        System.out.println("-------获取数据成功order order order order-------");
        return orderList;
    }

    @Override
    public List<Order> selectOrderByStatus(String status) {
        int order_status = Integer.parseInt(status);
        List<Order> orderList = null;
        if (order_status == 0) {
            orderList = orderDao.selectAllOrder();
            System.out.println("-------获取数据成功order order order order-------");
        } else {
            orderList = orderDao.selectOrderByStatus(order_status);
        }
        return orderList;
    }

    @Override
    public Boolean AdminDeleteOrderById(int id) {
        int de_item = orderItemDao.AdminDeleteOrderItem(id);
        if ( de_item != 0) {
            int de_order = orderDao.AdminDeleteOrder(id);
            return de_order != 0;
        } else {
            return false;
        }
    }

    @Override
    public PageInfo<Order> getOrderpage(Integer pageNum, String status){
        int order_status = Integer.parseInt(status);
        PageInfo<Order> Orderpage = null;
        if (order_status == 0) {

//        开启分页功能
            PageHelper.startPage(pageNum, 4);
//        查询所有的员工信息
            List<Order> orderList = orderDao.selectAllOrder();
//        获取分页相关的数据
            Orderpage = new PageInfo<>(orderList, 5);
            System.out.println("-------获取数据成功order order order order-------");
        } else {
            //        开启分页功能
            PageHelper.startPage(pageNum, 4);
//        查询所有的员工信息
            List<Order> orderList = orderDao.selectOrderByStatus(order_status);
//        获取分页相关的数据
            Orderpage = new PageInfo<>(orderList, 3);
        }
        return Orderpage;
    }

    @Override
    public List<Order> AdminSearchOrder(String searchValue) {
        return orderDao.AdminSearchOrder(searchValue);
    }

    @Override
    public List<Order> getMyBuyOrder(int userId) {

        List<Order> myBuyOrderLists = orderDao.getOrderByUser(userId);

        for(Order o : myBuyOrderLists){

            List<OrderItem> orderItemList = orderItemDao.getMyBuyOrderItem(o.getId());

            for(OrderItem orderItem : orderItemList){

                String goodsName = goodsDao.findGood(orderItem.getGoods().getId()).getName();
                orderItem.setGoodsName(goodsName);

            }
            o.setItemList(orderItemList);
//            Map<Integer,OrderItem> map = new LinkedHashMap<>();
//            for (OrderItem orderItem : orderItemList){
//                map.put(orderItem.getId(),orderItem);
//            }
//            o.setItemMap(map);

        }

        return myBuyOrderLists;
    }

    @Override
    public int delMyBuyOrder(int orderId) {

        //int count = orderDao.delMyBuyOrder(orderId);

        int count = orderItemDao.delMyBuyOrderItem(orderId);

        int count1 = orderDao.delMyBuyOrder(orderId);

        return count;
    }

    @Override
    public Map getMySellOrder(int userId) {

        List<OrderItem> orderItemList = orderItemDao.getMySellOrder(userId);


        Map<Object, List<OrderItem>> map = orderItemList.stream().collect(Collectors.groupingBy(doc -> doc.getOrder().getId()));


        return map;
    }


}
