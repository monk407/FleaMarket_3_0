package com.endless.controller;

import com.endless.pojo.Goods;
import com.endless.pojo.Order;
import com.endless.pojo.Type;
import com.endless.pojo.User;
import com.endless.service.GoodsService;
import com.endless.service.OrderService;
import com.endless.service.TypeService;
import com.endless.service.UserService;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Resource
    private UserService userService;
    @Resource
    private GoodsService goodsService;
    @Resource
    private TypeService typeService;
    @Resource
    private OrderService orderService;

    //    CYJ!!!!!!!!!!!!!!!
    @RequestMapping("/SelectallUser.do")
    public void SelectallUser(HttpServletResponse response, HttpServletRequest request) {
        List<User> user = userService.findUser();
        request.setAttribute("users", user);
        ObjectMapper om = new ObjectMapper();
        try {
            String ujson = om.writeValueAsString(user);
            response.setContentType("text/html;charset=UTF-8");
            System.out.println(ujson);
            response.getWriter().write(ujson);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //管理员首页
    @RequestMapping("/GoHomeManage.do")
    public String GoHomeManage(HttpServletRequest request, HttpServletResponse response) {
        return "redirect:/admin/SelectDataColumn.do";
    }

    //读数据库行数
    @RequestMapping("/SelectDataColumn.do")
    public String SelectDataColumn(HttpSession session) {
        int goods_column = goodsService.selectGoodsColumn();
        int user_column = userService.selectUserColumn();
        int order_column = orderService.selectOrderColumn();
        session.setAttribute("goods_column", String.valueOf(goods_column));
        session.setAttribute("user_column", String.valueOf(user_column));
        session.setAttribute("order_column", String.valueOf(order_column));
        return "redirect:/admin/GoHomeManageTmp.do";
    }

    @RequestMapping("/GoHomeManageTmp.do")
    public String GoHomeManageTmp(HttpServletRequest request, HttpServletResponse response) {
        return "/admin/HomePage";
    }

    //商品管理
    @RequestMapping("/GoItemManage.do")
    public String GoItemManage(HttpSession session) {
        List<Goods> goods = goodsService.findAllGoods();
        session.setAttribute("goods",goods);
        return "redirect:/admin/GoItemManageTmp.do";
    }

    @RequestMapping("/GoItemManageTmp.do")
    public String GoItemManageTmp(HttpServletRequest request, HttpServletResponse response) {
        return "/admin/good_list";
    }


    @RequestMapping("/GoUserManage.do")
    public String GoUserManage(RedirectAttributes attr, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        List<User> users = userService.findUser();
        session.setAttribute("users", users);
        return "redirect:/admin/GoUserManageTmp.do";
    }

    @RequestMapping("/GoUserManageTmp.do")
    public String GoUserManageTmp(HttpSession session) {
        return "/admin/User_list";
    }

        @RequestMapping("/GoUserAdd.do")
    public String GoUserAdd(HttpServletRequest request, HttpServletResponse response) {
        return "redirect:/admin/GoUserAddTmp.do";
    }
    @RequestMapping("/GoUserAddTmp.do")
    public String GoUserAddTmp(HttpServletRequest request, HttpServletResponse response) {
        return "/admin/User_add";
    }




//   ============================分割线============================



//    ============================管理员首页============================


//    ============================商品管理============================

    //商品管理----分页！！！！！！！！！！！！！
    @RequestMapping(value = "/AdmingetGoodPage.do")
    public String AdmingetGoodPage(@ModelAttribute("pageNum") String pageNum,@ModelAttribute("type") String type, HttpSession session) {
        System.out.println("!!!");
        System.out.println("%%%%%%%%%%%%%%%%" + type + "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
        System.out.println("!!!");
        int i = Integer.parseInt(pageNum);
        if (type.equals("0")){
            PageInfo<Goods> page = goodsService.getGoodpage(i);
            List<Type> types = typeService.AdminGetAllType();
//        System.out.println("%%%%%%%%%%%%%%%%" + page + "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
            session.setAttribute("typeID",type);
            session.setAttribute("page", page);
            session.setAttribute("types",types);
            return "redirect:/admin/AdmingetGoodPageTmp.do";
        }else{
            int typeID = Integer.parseInt(type);
            PageInfo<Goods> page = goodsService.getGoodTypepage(i,typeID);
            List<Type> types = typeService.AdminGetAllType();
//        System.out.println("%%%%%%%%%%%%%%%%" + page + "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
            session.setAttribute("typeID",type);
            session.setAttribute("page", page);
            session.setAttribute("types",types);
            return "redirect:/admin/AdmingetGoodPageTmp.do";

        }

    }

    //商品管理----分页跳转！！！！!!!!!!!!
    @RequestMapping(value = "/AdmingetGoodPage2.do")
    @ResponseBody
    public String AdmingetGoodPage2(@RequestParam("pageNum") String pageNum,@ModelAttribute("type") String type, HttpSession session) {
        int i = Integer.parseInt(pageNum);
        if (type.equals("0")){
            PageInfo<Goods> page = goodsService.getGoodpage(i);
            List<Type> types = typeService.AdminGetAllType();
//            System.out.println(page.getPageNum() + "%%%%%" + i + "%%%%%%%%%%%" + page + "%%%%%%%%%%%%");
            session.setAttribute("typeID",type);
            session.setAttribute("page", page);
            session.setAttribute("types",types);
            if (i <= page.getPageNum()) {
                System.out.println("跳转成功");
                return "true";
            } else {
                System.out.println("跳转失败");
                return "false";
            }

        }else{
            int typeID = Integer.parseInt(type);
            PageInfo<Goods> page = goodsService.getGoodTypepage(i,typeID);
            List<Type> types = typeService.AdminGetAllType();
//        System.out.println("%%%%%%%%%%%%%%%%" + page + "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
            session.setAttribute("typeID",type);
            session.setAttribute("page", page);
            session.setAttribute("types",types);
            if (i <= page.getPageNum()) {
                System.out.println("跳转成功");
                return "true";
            } else {
                System.out.println("跳转失败");
                return "false";
            }

        }


    }

    //   商品管理页面----默认第一页!!!!!!!!!!!!!!!!!!!
    @RequestMapping("/AdmingetGoodPageTmp.do")
    public String AdmingetGoodPageTmp() {
        return "/admin/good_list";
    }


    //  商品管理页面-----删除
    @RequestMapping("/AdminDeleteGood.do")
    @ResponseBody
    public String AdminDeleteGood(@RequestParam("DeleteID") String DeleteID,HttpSession session) {
        int ID = Integer.parseInt(DeleteID);
        Goods good = goodsService.findGood(ID);
        Boolean flag = goodsService.AdminDeleteGoodsByid(ID);
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


//    ============================用户管理====================================
    //    用户管理----添加用户！！！！！！！！！！！
    @RequestMapping("/Admin_User_Add.do")
    @ResponseBody
    public String Admin_User_Add(@RequestParam("username") String username, @RequestParam("email") String email,
                                 @RequestParam("password") String password, @RequestParam("name") String name,
                                 @RequestParam("phone") String phone, @RequestParam("address") String address,
                                 @RequestParam("isadmin") Boolean isAdmin) {

//        System.out.println(username + "@@" + email + "@@" + password + "@@" + name + "@@" + phone + "@@" + address + "@@" + isAdmin);
        Boolean flag = userService.AdminAddUser(username, email, password, name, phone, address, isAdmin);
        if (flag) {
            System.out.println("添加成功!!!!");
            return "true";
        } else {
            System.out.println("添加失败!!!!");
            return "false";
        }
    }

    //用户管理----分页！！！！！！！！！！！！！
    @RequestMapping(value = "/AdmingetUserPage.do")
    public String AdmingetUserPage(@ModelAttribute("pageNum") String pageNum, HttpSession session) {
        int i = Integer.parseInt(pageNum);
        PageInfo<User> userpage = userService.getUserpage(i);
//        System.out.println("%%%%%%%%%%%%%%%%" + page + "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
        session.setAttribute("userpage", userpage);
        return "redirect:/admin/AdmingetUserPageTmp.do";
    }

    //用户管理----分页跳转！！！！!!!!!!!!
    @RequestMapping(value = "/AdmingetUserPage2.do")
    @ResponseBody
    public String AdmingetUserPage2(@RequestParam("pageNum") String pageNum, HttpSession session) {
        int i = Integer.parseInt(pageNum);
        PageInfo<User> userpage = userService.getUserpage(i);
        System.out.println(userpage.getPageNum() + "%%%%%" + i + "%%%%%%%%%%%" + userpage + "%%%%%%%%%%%%");
        session.setAttribute("userpage", userpage);
        if (i <= userpage.getPageNum()) {
            System.out.println("跳转成功");
            return "true";
        } else {
            System.out.println("跳转失败");
            return "false";
        }
    }

    //    用户管理页面----默认第一页!!!!!!!!!!!!!!!!!!!
    @RequestMapping("/AdmingetUserPageTmp.do")
    public String AdmingetUserPageTmp(HttpServletRequest request, HttpServletResponse response) {
        return "/admin/User_list";
    }

    //用户管理---重置密码!!!!!!!!!!!
    @RequestMapping("/Admin_Go_ResetPassword.do")
    @ResponseBody
    public String Admin_Go_ResetPassword(@RequestParam("PasswordID") String PasswordID, HttpSession session) {
        int ID = Integer.parseInt(PasswordID);
        session.setAttribute("ID", ID);
        System.out.println(session.getAttribute("ID") + "@@@@@@@@@@@@@@@@@@@@@@@@@");
        if (PasswordID != null) {
            System.out.println("获取成功！！！！");
            return "true";
        } else {
            System.out.println("获取失败！！！！");
            return "false";
        }
    }

    @RequestMapping("/Admin_Go_ResetPasswordTmp.do")
    public String Admin_Go_ResetPasswordTmp() {
        return "/admin/User_reset";
    }


    //    重置密码页面，点击确定！！！！！！！！！！！！！！
    @RequestMapping("/Admin_Reset_Password.do")
    @ResponseBody
    public String Admin_Reset_Password(HttpSession session) {
        System.out.println("!@#!!!!!!!!!!#!@#!@#" + session.getAttribute("ID"));
        System.out.println("!@#!!!!!!!!!!#!@#!@#" + session.getAttribute("ID").getClass().getTypeName());
        Boolean flag = userService.resetPassword((Integer) session.getAttribute("ID"));
        if (flag) {
            return "true";
        } else return "false";

    }

    //  用户管理-------修改
    @RequestMapping("/Admin_Go_UpdateUser.do")
    @ResponseBody
    public String Admin_Go_UpdateUser(@RequestParam("UpdateID") String UpdateID, HttpSession session) {
//        return "forward:/admin/HomePage";
        int ID = Integer.parseInt(UpdateID);
        User user = userService.AdminFindUpdateUser(ID);
        session.setAttribute("user", user);
        System.out.println(session.getAttribute("user") + "@@@@@@@@@@@@@@@@@@@@@@@@@");
        if (user != null) {
            System.out.println("获取成功！！！！");
            return "true";
        } else {
            System.out.println("获取失败！！！！");
            return "false";
        }
    }

    @RequestMapping("/AdminUpdateUserTmp.do")
    public String AdminUpdateUserTmp(HttpSession session) {
        System.out.println(session.getAttribute("user") + "跳转用户修改页面之前获取到的user数据");
        return "/admin/User_edit";
    }

    @RequestMapping("/AdminUpdateUser.do")
    @ResponseBody
    public String AdminUpdateUser(HttpSession session, @RequestParam("id") int id, @RequestParam("username") String username, @RequestParam("email") String email,
                                  @RequestParam("password") String password, @RequestParam("name") String name,
                                  @RequestParam("phone") String phone, @RequestParam("address") String address,
                                  @RequestParam("isadmin") Boolean isAdmin) {
//        int Id = Integer.parseInt(id);
 /*先查询数据库中是否提交的用户名和邮箱相同的数据，要把改id除外
 * 成功之后修改数据库，不成功不修改
 * */
        User user = new User(id, username, email, password, name, phone, address, isAdmin);
        Boolean flag = userService.AdminUpdateUser(user);
        if (flag){
            System.out.println(user+"修改成功之后@@@@@@@@2@@！@！@@@@@@");
//          数据库中没有新修改的并且相同的用户名和数据，那么执行修改
                System.out.println("修改成功！！");
                return "true";
        }else {
//            查询数据库中有相同的用户命和邮箱，则不可修改
            System.out.println(user+"修改失败之后@@@@@@@@2@@！@！@@@@@@");
            System.out.println("修改失败！！");
            return "false";
        }
    }


    //  用户管理-----删除
    @RequestMapping("/AdminDeleteUser.do")
    @ResponseBody
    public String AdminDeleteUser(@RequestParam("DeleteID") String DeleteID, HttpSession session) {
        int ID = Integer.parseInt(DeleteID);
        Boolean flag = userService.AdminDeleteUserByid(ID);
        if (flag) {
            return "true";
        } else return "false";
    }




//    ============================订单管理============================
    // 订单管理
    @RequestMapping("/GoOrderManage.do")
    public String GoOrderManage(HttpSession session, HttpServletResponse response) {
        List<Order> orders = orderService.selectAllOrder();
        session.setAttribute("orders", orders);
        return "redirect:/admin/GoOrderManageTmp.do";
    }

    //订单管理------------分页！！！！
    @RequestMapping(value = "/AdminGetOrderPage.do")
    public String AdminGetOrderPage(@ModelAttribute("pageNum") String pageNum,@ModelAttribute("status") String status, HttpSession session) { System.out.println("%%%%%%%%%%%%%%%%" + status + "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
        int i = Integer.parseInt(pageNum);
        PageInfo<Order> orderpage = orderService.getOrderpage(i,status);
        session.setAttribute("orderpage", orderpage);
        session.setAttribute("status", status);
        return "redirect:/admin/GoOrderManageTmp.do";

    }

    //订单管理----分页跳转！！！！!!!!!!!!
    @RequestMapping(value = "/AdminGetOrderPage2.do")
    @ResponseBody
    public String AdminGetOrderPage2(@RequestParam("pageNum") String pageNum,@ModelAttribute("status") String status, HttpSession session) {
        int i = Integer.parseInt(pageNum);
//        int typeID = Integer.parseInt(type);
        PageInfo<Order> orderpage = orderService.getOrderpage(i,status);
        session.setAttribute("status", status);
        session.setAttribute("orderpage", orderpage);

        if (i <= orderpage.getPageNum()) {
            System.out.println("跳转成功");
            return "true";
        } else {
            System.out.println("跳转失败");
            return "false";
        }
    }

    @RequestMapping("/GoOrderManageTmp.do")
    public String GoOrderManageTmp(HttpServletRequest request, HttpServletResponse response) {
        return "/admin/Order_list";
    }

    //  订单管理 ----- 删除
    @RequestMapping("/AdminDeleteOrder.do")
    @ResponseBody
    public String AdminDeleteOrder(@RequestParam("DeleteID") String DeleteID, HttpSession session) {
        int id = Integer.parseInt(DeleteID);
        Boolean flag = orderService.AdminDeleteOrderById(id);
        if (flag) {
            return "true";
        } else {
            return "false";
        }
    }

    //搜索订单功能
    @RequestMapping(value = "/AdminSearchOrder.do")
    @ResponseBody
    public String AdminSearchOrder(@RequestParam("searchValue") String searchValue, HttpSession session) {

        List<Order> orders = orderService.AdminSearchOrder(searchValue);
        if (orders.size()!=0){
            session.setAttribute("orders", orders);
            System.out.println(session.getAttribute("orders")+"@@@@@session.setAttribute()@@@@@@@@@@@@");
            return "true";
        }else return "false";
    }

    //跳转到搜索之后的页面
    @RequestMapping("/AdminGoSearchOrderPage.do")
    public String AdminGoSearchOrderPage(HttpSession session) {
        System.out.println(session.getAttribute("orders")+"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        return "redirect:/admin/GoSearchOrderPageTmp.do";
    }

    @RequestMapping("/GoSearchOrderPageTmp.do")
    public String GoSearchOrderPageTmp(HttpServletRequest request, HttpServletResponse response) {
        return "/admin/Search_Order_List";
    }




//    ============================商品类型管理============================

//    商品类型管理---界面
    @RequestMapping("/GoOrderTypeManage.do")
    public String GoOrderTypeManage(HttpSession session) {
        List<Type> typeList = typeService.AdminGetAllType();
        session.setAttribute("typeList",typeList);
        return "redirect:/admin/GoOrderTypeManageTmp.do";
    }

    @RequestMapping("/GoOrderTypeManageTmp.do")
    public String GoOrderTypeManageTmp(HttpServletRequest request, HttpServletResponse response) {
        return "/admin/Type_list";
    }

    //商品类型管理-----添加商品类型界面
    @RequestMapping("/GoAddOrderType.do")
    public String GoAddOrderItem(HttpServletRequest request, HttpServletResponse response) {
        return "redirect:/admin/GoAddOrderTypeTmp.do";
    }

    @RequestMapping("/GoAddOrderTypeTmp.do")
    public String GoAddOrderTypeTmp(HttpServletRequest request, HttpServletResponse response) {
        return "/admin/Type_add";
    }

//    添加商品类型界面
    @RequestMapping("/AdminAddType.do")
    @ResponseBody
    public String AdminAddType(@RequestParam("typename") String typename) {

        System.out.println(typename + "@@" );
        Boolean flag = typeService.AdminAddTypeService(typename);
        if (flag) {
            System.out.println("添加成功!!!!");
            return "true";
        } else {
            System.out.println("添加失败!!!!");
            return "false";

        }
    }


    //  商品类型修改--去到修改页面，并且回显
    @RequestMapping("/Admin_Go_UpdateType.do")
    @ResponseBody
    public String Admin_Go_UpdateType(@RequestParam("UpdateID") String UpdateID, HttpSession session) {
        int updateid = Integer.parseInt(UpdateID);
        Type type = typeService.AdminGetTypeByid(updateid);
        session.setAttribute("type", type);
        System.out.println(session.getAttribute("type") + "@@@@@@@@@@@@@@@@@@@@@@@@@");
        if (type != null) {
            System.out.println("获取成功！！！！");
            return "true";
        } else {
            System.out.println("获取失败！！！！");
            return "false";
        }
    }

    @RequestMapping("/Admin_Go_UpdateTypePage.do")
    public String Admin_Go_UpdateTypePage(HttpServletRequest request, HttpServletResponse response) {
        return "redirect:/admin/Admin_Go_UpdateTypePageTmp.do";
    }

    @RequestMapping("/Admin_Go_UpdateTypePageTmp.do")
    public String Admin_Go_UpdateTypePageTmp(HttpServletRequest request, HttpServletResponse response) {
        return "/admin/Type_edit";
    }


    //修改商品类型
    @RequestMapping("/AdminUpdateType.do")
    @ResponseBody
    public String AdminUpdateType(@RequestParam("typeid") String typeid ,@RequestParam("typename")String typename) {

        int typeid2 = Integer.parseInt(typeid);
        System.out.println(typeid2 + "@@" );
        Boolean flag = typeService.AdminUpdateType(typeid2, typename);
        if (flag) {
            System.out.println("修改成功!!!!");
            return "true";
        } else {
            System.out.println("修改失败!!!!");
            return "false";

        }
    }

//删除商品类型
    @RequestMapping("/AdminDeleteType.do")
    @ResponseBody
    public String AdminDeleteType(@RequestParam("DeleteID") String DeleteID) {

        int deleteid = Integer.parseInt(DeleteID);
        System.out.println(DeleteID + "@@" );
        Boolean flag = typeService.AdminDeleteType(deleteid);
        if (flag) {
            System.out.println("删除成功!!!!");
            return "true";
        } else {
            System.out.println("删除失败!!!!");
            return "false";

        }
    }

//    ===================搜索框============================

    //搜索用户功能
    @RequestMapping(value = "/AdminSearchUser.do")
    @ResponseBody
    public String AdminSearchUser(@RequestParam("searchValue") String searchValue, HttpSession session) {

        List<User> users = userService.AdminSearchUser(searchValue);
        if (users.size()!=0){
            session.setAttribute("users", users);
            System.out.println(session.getAttribute("users")+"@@@@@session.setAttribute()@@@@@@@@@@@@");
            return "true";
        }else return "false";
    }
//跳转到搜索之后的页面
    @RequestMapping("/AdminGoSearchUserPage.do")
    public String AdminGoSearchUserPage(HttpSession session) {
        System.out.println(session.getAttribute("users")+"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        return "redirect:/admin/GoSearchUserpageTmp.do";
    }

    @RequestMapping("/GoSearchUserpageTmp.do")
    public String GoSearchUserpageTmp(HttpServletRequest request, HttpServletResponse response) {
        return "/admin/Search_User_list";
    }


    //搜索商品功能
    @RequestMapping(value = "/AdminSearchGood.do")
    @ResponseBody
    public String AdminSearchGood(@RequestParam("searchValue") String searchValue, HttpSession session) {

        List<Goods> goods = goodsService.AdminSearchGood(searchValue);
        if (goods.size()!=0){
            session.setAttribute("goods", goods);
            System.out.println(session.getAttribute("goods")+"@@@@@session.setAttribute()@@@@@@@@@@@@");
            return "true";
        }else return "false";
    }
    //跳转到搜索之后的页面
    @RequestMapping("/AdminGoSearchGoodPage.do")
    public String AdminGoSearchGoodPage(HttpSession session) {
        System.out.println(session.getAttribute("goods")+"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        return "redirect:/admin/GoSearchGoodpageTmp.do";
    }

    @RequestMapping("/GoSearchGoodpageTmp.do")
    public String GoSearchGoodpageTmp(HttpServletRequest request, HttpServletResponse response) {
        return "/admin/Search_good_list";
    }



}


//    CYJ!!!!!!!!!!!!!!!


