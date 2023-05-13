package com.endless.controller;

import com.endless.pojo.*;
import com.endless.service.GoodsService;
//import com.sun.xml.internal.ws.api.ha.StickyFeature;
import com.endless.service.TypeService;
import com.endless.utils.PriceUtils;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequestMapping("goods")
public class GoodsController {

    @Resource
    private GoodsService goodsService;
    @Resource
    private TypeService typeService;

    @RequestMapping("recommendGoods.do")
    @ResponseBody
    public List<Goods> recommendGoods(HttpSession session){

        List<Goods> recommendGoodsList = goodsService.recommendGoodsList();
        List<Goods> recommendGoodsList2 = goodsService.recommendGoodsList();
        session.setAttribute("lunBo",recommendGoodsList2);
        return recommendGoodsList;

    }

    @RequestMapping("goodsDetail.do")
    public String goodsDetail(Model model,@RequestParam("goodsid")int id){

        Goods good = goodsService.findGood(id);
        //System.out.println(good);
        model.addAttribute("good",good);
        return "forward:/GoodDetail.jsp";

    }

    //查看该商品的库存是否足够
    @RequestMapping("addGoodsCount.do")
    @ResponseBody
    public String addGoodsCount(@RequestParam("id") int id,@RequestParam("count") int count){

        int goodStock = goodsService.findGoodStock(id);
        //System.out.println(goodStock);
        System.out.println(count);
        if(count >= goodStock){

            return "false";

        }
        return "true";

    }

    @RequestMapping("modGoodsCount.do")
    @ResponseBody
    public String modGoodsCount(@RequestParam("id") int id,@RequestParam("count") int count){

        int goodStock = goodsService.findGoodStock(id);
        //System.out.println(goodStock);
        System.out.println(count);
        if(count > goodStock){

            return "false";

        }
        return "true";

    }

    @RequestMapping("insertShoppingCart.do")
    @ResponseBody
    public Map insertShoppingCart(@RequestParam("goodsid") int goodsid, @RequestParam("amount") int amount,HttpSession session){
        Map<String,Object> map = new HashMap<>();
        Order order = null;

        //如果购物车不为空，则获取购物车对象，否则新建一个购物车对象。购物车的本质就是一个订单，一个订单有多个订单项
        if(session.getAttribute("order") != null){
            order = (Order) session.getAttribute("order");
        }
        else {
            order = new Order();
            session.setAttribute("order",order);
        }

        Goods good = goodsService.findGood(goodsid);
        System.out.println(good);

        if( order.getItemMap().containsKey(goodsid) ){
            map.put("msg",true);
            return map;
        }
        //该商品不为空且库存不为0才能加入购物车
        else if(good != null && good.getStock() > 0){
            order.addGoods(good,amount);
            session.setAttribute("order",order);
            map.put("isInsetShopCart",true);//true表示 成功加入到购物车
            map.put("itemMapLength",order.getItemMap().size());//获取itemmap的长度，即购物车的商品的种类数
            map.put("msg",false);
            return map;
        }
        else {
            map.put("isInsetShopCart",false);
            map.put("msg",false);
            return map;
        }

    }

    @RequestMapping("sort.do")
    public String sortByType(Model model,@RequestParam("type") String type){

        System.out.println(type);
        List<Goods> goodsList = goodsService.findGoodsByType(type);
        model.addAttribute("goodsList",goodsList);
        return "forward:/Good_List.jsp";
    }

    @RequestMapping("sortPage.do")
    public String sortPage(Model model,@RequestParam("type") String type,@RequestParam("pageNum") String pageNum){
        int i = Integer.parseInt(pageNum);
        System.out.println(type);
        PageInfo<Goods> goodsByTypePage = goodsService.findGoodsByTypePage(i, type);
        model.addAttribute("goodsByTypePage",goodsByTypePage);
        model.addAttribute("typeID",type);
        return "forward:/Good_List.jsp";
    }
    //商品管理----分页跳转！！！！!!!!!!!!
    @RequestMapping(value = "/sortPage2.do")
    @ResponseBody
    public String sortPage2(Model model,@RequestParam("pageNum") String pageNum,@ModelAttribute("type") String type) {
        int i = Integer.parseInt(pageNum);
        System.out.println(type);
        PageInfo<Goods> goodsByTypePage = goodsService.findGoodsByTypePage(i, type);
        model.addAttribute("goodsByTypePage",goodsByTypePage);
        model.addAttribute("typeID",type);
        if (i <= goodsByTypePage.getPageNum()) {
            System.out.println("跳转成功");
            return "true";
        } else {
            System.out.println("跳转失败");
            return "false";
        }
    }


    @RequestMapping("searchGoods.do")
    @ResponseBody
    public List<Goods> searchGoods(@RequestParam("searchGoods") String searchGoodsName,HttpSession session){

        List<Goods> searchGoodsList = goodsService.searchGoods(searchGoodsName);
        session.setAttribute("searchGoodsList",searchGoodsList);
        session.setAttribute("searchInput",searchGoodsName);
        return searchGoodsList;
    }

    @RequestMapping("updateShopCart.do")
    @ResponseBody
    public Map updateShopCart(@RequestParam("id") int goodsid, @RequestParam("amount") int amount,HttpSession session){
        Map map = new HashMap();
        Order order = (Order) session.getAttribute("order");

        Goods goods = goodsService.findGood(goodsid);

        Order updateOrder = goodsService.updateShopCart(goods,order,amount);

        session.setAttribute("order",order);
        map.put("flag","true");
        return map;

    }

    @RequestMapping("delCartGoods.do")
    @ResponseBody
    public Map delCartGoods(@RequestParam("id") int goodsid, @RequestParam("amount") int amount,@RequestParam("oiPrice") String oiPrice,HttpSession session){
        Map map = new HashMap();
        System.out.println("==="+goodsid+"==="+amount+"==="+oiPrice);
        //获取购物车信息
        Order order = (Order) session.getAttribute("order");
        //修改购物车的所有商品总数量和总价格
        order.setAmount(order.getAmount()-amount);
        order.setTotal(PriceUtils.subtract(order.getTotal(),Float.parseFloat(oiPrice)));
        //删除购物车该商品的orderitem
        order.getItemMap().remove(goodsid);
        //更新session中购物车
        session.setAttribute("order",order);
        map.put("msg","购物车更新成功");
        map.put("oiLength",order.getItemMap().size());
        return map;
    }

    @RequestMapping("sortSelectGoodsInCart.do")
    @ResponseBody
    public Map sortSelectGoodsInCart(@RequestBody List<Map<String,String>> goods,HttpSession session){
        System.out.println(goods);

        //将选择的商品按照卖家的id进行排序并分组
        Map<String, List<Map<String, String>>> sortSelectGoodsMap = goods.stream().collect(Collectors.groupingBy(doc -> doc.get("saleUserId")));
        sortSelectGoodsMap.forEach((k, v) -> {
            System.out.println(k + " ===== " + v);
        });

        session.setAttribute("sortSelectGoodsMap",sortSelectGoodsMap);

        Map map = new HashMap();
        map.put("msg",true);
        return map;
    }

    @RequestMapping("submitOrder.do")
    @ResponseBody
    public Map submitOrder(HttpSession session,String address,String name,String phone){
        System.out.println(address+name+phone);

        Map map = goodsService.subOrder(session,address,name,phone);

        //true说明提交订单成功
        if ("true".equals(map.get("msg"))){
            System.out.println("提交订单成功");
            map.put("flag",true);
            return map;
        }
        else {
            List<String> list = (List<String>) map.get("msgMap");
            map.put("errGoods",list);
            map.put("flag",false);
            return map;
//            for (String s : list){
//                System.out.println(s);
//            }
        }

    }


    //我的商品----分页！！！！！！！！！！！！！
    @RequestMapping(value = "/GetMyGoodsPage.do")
    public String GetMyGoodsPage(@ModelAttribute("pageNum") String pageNum, @ModelAttribute("userid") String userid, HttpSession session) {
        System.out.println("!!!");
        System.out.println("!!!");
        int pageNum2 = Integer.parseInt(pageNum);
        int userid2 = Integer.parseInt(userid);
        PageInfo<Goods> mygoodspage = goodsService.GetMyGoodsPage(pageNum2, userid2);
        System.out.println("%%%%%%%%%%%%%%%%" + mygoodspage + "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
        session.setAttribute("mygoodspage", mygoodspage);
//        return "forward:/MyGoods.jsp";
        return "redirect:/MyGoods.jsp";
    }

    //我的商品----分页跳转！！！！!!!!!!!!
    @RequestMapping(value = "/GetMyGoodsPage2.do")
    @ResponseBody
    public String GetMyGoodsPage2(@RequestParam("pageNum") String pageNum, @RequestParam("userid") String userid, HttpSession session) {
        int pageNum2 = Integer.parseInt(pageNum);
        int userid2 = Integer.parseInt(userid);
        PageInfo<Goods> mygoodspage = goodsService.GetMyGoodsPage(pageNum2, userid2);
        System.out.println(mygoodspage.getPageNum() + "%%%%%" + pageNum2 + "%%%%%%%%%%%" + mygoodspage + "%%%%%%%%%%%%");
//        session.setAttribute("mygoodspage", mygoodspage);
        if (pageNum2 <= mygoodspage.getPageNum()) {
            System.out.println("跳转成功");
            return "true";
        } else {
            System.out.println("跳转失败");
            return "false";
        }
    }

    //  我的商品-----删除
    @RequestMapping("/DeleteMyGood.do")
    @ResponseBody
    public String AdminDeleteGood(@RequestParam("DeleteID") String DeleteID,HttpSession session) {
        int ID = Integer.parseInt(DeleteID);
        Goods good = goodsService.findGood(ID);
        Boolean flag = goodsService.DeleteMyGoodsByid(ID);
        if (flag) {
            //组装成当前项目picture路径
            String rootPath = "";
            String[] words = session.getServletContext().getRealPath("/").split("\\\\");
            for(int i = 0 ; i < words.length - 2 ; i++){
                rootPath = rootPath + words[i] + "\\";
            }
            rootPath = rootPath + "src\\main\\webapp";
            String imagePlace1 = good.getImage();
            String[] pathArray = imagePlace1.split("/");
            String imagePlace2 = "\\" + pathArray[1] + "\\" + pathArray[2];
            // 目标文件
            String fullPath = rootPath  + imagePlace2;
            System.err.println("这是路径！！！："+fullPath);
            File deleteFile = new File(fullPath);
            if (deleteFile.delete()){
                return "true";
            }
            return "false";
        } else return "false";
    }

    //获取商品类型之后，跳转到商品添加页面
    @RequestMapping("/GoGoodAdd.do")
    public String GoGoodAdd(HttpSession session) {

        List<Type> types = typeService.MyGoodGetAllType();
        session.setAttribute("types", types);
        return "forward:/Good_add.jsp";
    }

    @RequestMapping("editGoodLoadType.do")
    public String editGoodLoadType(HttpSession session,HttpServletRequest request,@RequestParam("goodsId") String goodsId) {

        List<Type> types = typeService.MyGoodGetAllType();
        int GOODID = Integer.parseInt(goodsId);
        Goods edit_good = goodsService.findGood(GOODID);
        String[] split = edit_good.getImage().split("/");
        String picturePath = split[2];
        session.setAttribute("picturePath",picturePath);
        session.setAttribute("edit_good",edit_good);
        session.setAttribute("types", types);
        request.setAttribute("goodsId",goodsId);
        return "forward:/Good_edit.jsp";
    }

    //    添加商品！！！！！！！！！！！
    @RequestMapping("/GoodsAdd.do")
    @ResponseBody
    public String GoodsAdd(HttpServletRequest request, @RequestParam("goodsName") String goodsName, @RequestParam("goodsPrice") String goodsPrice,
                           @RequestParam("goodsIntro") String goodsIntro, @RequestParam("goodsStock") String goodsStock,
                           @RequestParam("goodstype") String goodstype, @RequestParam("userid") String userid) {


        System.out.println(goodsName + "," + goodsPrice + "," + goodsIntro + "," + goodsStock + "," + goodstype + "," + userid);
        String realPath = request.getSession().getServletContext().getRealPath("/");
        System.out.println(request.getSession().getServletContext().getContextPath());
        System.out.println("realPath:" + realPath);
        String path = request.getServletContext().getRealPath("/") + "files/";
        System.out.println("path:" + path);
        return "false";
    }


    @RequestMapping("/hotGoods.do")
    @ResponseBody
    public List<Goods> hotGoods(){

        List<Goods> hotGoodsList = goodsService.hotGoodsList();
        return hotGoodsList;

    }


    @RequestMapping("modifyMyOrderGoodsStatus.do")
    @ResponseBody
    public Map modifyMyOrderGoodsStatus(@RequestParam("orderId") String orderId){

        int count = goodsService.modifyMyOrderGoodsStatus(Integer.parseInt(orderId));

        Map map = new HashMap();
        map.put("msg",true);

        return map;

    }

    @RequestMapping("modifyMyOrderGoodsStock.do")
    @ResponseBody
    public void modifyMyOrderGoodsStock(@RequestParam("orderId") String orderId){

        int count = goodsService.modifyMyOrderGoodsStock(Integer.parseInt(orderId));

    }

    @RequestMapping("modifyMyOrderGoodsStatus2.do")
    @ResponseBody
    public void modifyMyOrderGoodsStatus2(@RequestParam("orderId") String orderId){

        System.out.println(orderId);

        int count = goodsService.modifyMySellGoodsStock(Integer.parseInt(orderId));

    }


    @RequestMapping("uploadNewGoods.do")
    public void uploadNewGoods(@RequestParam("goodsName") String goodsName, @RequestParam("imageFile") MultipartFile file,
                                       @RequestParam("goodsPrice") String goodsPrice, @RequestParam("goodsIntro") String goodsIntro,
                                       @RequestParam("goodsStock") String goodsStock, @RequestParam("type") String type, HttpServletResponse response,HttpSession session) throws IOException {


        System.out.println("==>"+goodsName+"==>"+goodsPrice+"==>"+goodsIntro+"==>"+goodsStock+"==>"+type+"==>"+file);
        if("".equals(goodsName.trim()) || "".equals(file.getOriginalFilename().trim()) || "".equals(goodsPrice.trim()) || "".equals(goodsIntro.trim()) || "".equals(goodsStock.trim())){
            response.getWriter().write("<script>alert('请填好全部商品信息！');window.location.href='/Good_add.jsp';</script>");
            return;
        }


        // 文件的完整名称,如spring.jpg
        String filename = file.getOriginalFilename();
        // 文件名,如spring
        String name = filename.substring(0, filename.indexOf("."));
        // 文件后缀,如.jpg
        String suffix = filename.substring(filename.lastIndexOf("."));
        String allowSuffix = ".jpg.png";
        if (allowSuffix.indexOf(suffix) == -1) {
            response.getWriter().write("<script>alert('仅支持jpg和png格式');window.location.href='/Good_add.jsp';</script>");
            return;
        }

        String filePath = goodsService.insertNewGoods(goodsName,suffix,Float.parseFloat(goodsPrice),goodsIntro,Integer.parseInt(goodsStock),type,((User)session.getAttribute("user")).getId());

        //组装成当前项目picture路径
        String rootPath = "";
        String[] words = session.getServletContext().getRealPath("/").split("\\\\");
        for(int i = 0 ; i < words.length - 2 ; i++){
            rootPath = rootPath + words[i] + "\\";
        }
        rootPath = rootPath + "src\\main\\webapp\\picture\\";
        // 目标文件
        String fullPath = rootPath  + filePath;
        System.out.println("这是路径！！！："+fullPath);
        File descFile = new File(fullPath);
        // 存储文件
        try {
            file.transferTo(descFile);
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.getWriter().write("<script>alert('添加商品成功!');window.location.href='/Good_add.jsp'; </script>");
    }


    @RequestMapping("editGoods.do")
    public void editGoods(@RequestParam("goodsId") String goodsId,@RequestParam("goodsName") String goodsName, @RequestParam("imageFile") MultipartFile file,
                          @RequestParam("goodsPrice") String goodsPrice, @RequestParam("goodsIntro") String goodsIntro,
                          @RequestParam("goodsStock") String goodsStock, @RequestParam("type") String type, HttpServletResponse response,HttpSession session) throws IOException {

        System.out.println(goodsId+"==>"+goodsName+"==>"+goodsPrice+"==>"+goodsIntro+"==>"+goodsStock+"==>"+type+"==>"+file);

        int GOODID = Integer.parseInt(goodsId);
        Goods edit_good = goodsService.findGood(GOODID);


        if("".equals(goodsName.trim()) || "".equals(file.getOriginalFilename().trim()) || "".equals(goodsPrice.trim()) || "".equals(goodsIntro.trim()) || "".equals(goodsStock.trim())){
//            String s = "<script>alert('修改商品成功!');window.location.href='/goods/editGoodLoadType.do?goodsId="+goodsId+"'; </script>";
            String s = "<script>alert('修改商品成功!');window.location.href='/goods/GetMyGoodsPage.do?userid="+edit_good.getUser().getId()+"&pageNum=1"+"'; </script>";
            response.getWriter().write(s);
            return;
        }


        // 文件的完整名称,如spring.jpg
        String filename = file.getOriginalFilename();
        // 文件名,如spring
        String name = filename.substring(0, filename.indexOf("."));
        // 文件后缀,如.jpg
        String suffix = filename.substring(filename.lastIndexOf("."));
        String allowSuffix = ".jpg.png";
        if (allowSuffix.indexOf(suffix) == -1) {
            String s = "<script>alert('仅支持jpg和png格式');window.location.href='/goods/editGoodLoadType.do?goodsId="+goodsId+"';</script>";
            response.getWriter().write(s);
            return;
        }

        String imageName = goodsService.editGoods(goodsId,goodsName,suffix,Float.parseFloat(goodsPrice),goodsIntro,Integer.parseInt(goodsStock),type,((User)session.getAttribute("user")).getId());
        //组装成当前项目picture路径
        String rootPath = "";
        String[] words = session.getServletContext().getRealPath("/").split("\\\\");
        for(int i = 0 ; i < words.length - 2 ; i++){
            rootPath = rootPath + words[i] + "\\";
        }
        rootPath = rootPath + "src\\main\\webapp\\picture\\";
        // 目标文件
        String fullPath = rootPath  + imageName + suffix;
        File descFile = new File(fullPath);
        // 存储文件
        try {
            file.transferTo(descFile);
        } catch (Exception e) {
            e.printStackTrace();
        }
//        String s = "<script>alert('修改商品成功!');window.location.href='/goods/editGoodLoadType.do?goodsId="+goodsId+"'; </script>";
        String s = "<script>alert('修改商品成功!');window.location.href='/goods/GetMyGoodsPage.do?userid="+edit_good.getUser().getId()+"&pageNum=1"+"'; </script>";
        response.getWriter().write(s);
    }

}
