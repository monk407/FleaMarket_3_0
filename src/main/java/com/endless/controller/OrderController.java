package com.endless.controller;

import com.endless.pojo.Order;
import com.endless.pojo.OrderItem;
import com.endless.pojo.User;
import com.endless.service.OrderService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("order")
public class OrderController {

    @Resource
    private OrderService orderService;

    @RequestMapping("getMyBuyOrder.do")
    @ResponseBody
    public List<Order> getMyBuyOrder(HttpSession session){

        List<Order> myOrderLists = null;

        User user = (User) session.getAttribute("user");

        int userId = user.getId();

        myOrderLists = orderService.getMyBuyOrder(userId);

        return myOrderLists;
    }

    @RequestMapping("delMyBuyOrder.do")
    @ResponseBody
    public void delMyBuyOrder(@RequestParam("orderId") String orderId){

        //System.out.println(orderId);
        int count = orderService.delMyBuyOrder(Integer.parseInt(orderId));

    }


    @RequestMapping("getMySellOrder.do")
    @ResponseBody
    public Map getMySellOrder(HttpSession session){

        User user = (User) session.getAttribute("user");
        Map map = orderService.getMySellOrder(user.getId());

        return map;
    }

}
