package com.endless.dao;

import com.endless.pojo.Order;
import org.apache.ibatis.annotations.Param;

import java.sql.Timestamp;
import java.util.List;


public interface OrderDao {
    List<Order> selectOrders();
    //读取表中有多少条数据
    int selectOrderColumn();

    //根据订单id查订单
    Order selectOrderById(@Param("userid")int id);

    //查询所有的订单信息
    List<Order> selectAllOrder();

    //根据用户id查询该用户的所有订单
    List<Order> selectUserOrder(@Param("userid")int userid);

    int deleteOrderByUserid(@Param("userid")int userid);

    //按订单状态查询订单信息
    List<Order> selectOrderByStatus(@Param("status") int status);

    //根据订单id删除订单信息
    int AdminDeleteOrder(@Param("id") int id);

    //订单查询
    List<Order> AdminSearchOrder(@Param("searchValue") String searchValue);

    int addOrderByCart(@Param("orderTotal") float orderTotal,@Param("orderAmount") int orderAmount,@Param("status") int status,@Param("oname") String name,@Param("phone") String phone,@Param("address") String address,@Param("datetime") Timestamp datetime,@Param("orderUserId") int orderUserId);


    int findNewOrderIdByBuyIdInCart(@Param("buyId") int orderUserId);

    List<Order> getOrderByUser(@Param("userid") int userId);

    int delMyBuyOrder(@Param("id") int orderId);
}
