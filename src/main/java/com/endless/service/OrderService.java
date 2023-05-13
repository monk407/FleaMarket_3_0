package com.endless.service;

import com.endless.pojo.Order;
import com.endless.pojo.OrderItem;
import com.github.pagehelper.PageInfo;

import java.util.List;
import java.util.Map;

public interface OrderService {
    /**
     * @return 读取表中有多少条数据
     */
    int selectOrderColumn();

    /**
     * @return 商品表所有的信息
     */
    List<Order> selectAllOrder();

    /**
     * @return 按订单状态查询的订单信息
     */
    List<Order> selectOrderByStatus(String status);

    /**
     * 删除订单，传入删除的id
     * @param id
     * @return 成功true，失败或者其他false
     */
    Boolean AdminDeleteOrderById(int id);

    /**
     * 订单分页！！！全部类型
     * @param pageNum
     * @return
     */
    PageInfo<Order> getOrderpage(Integer pageNum, String status);

    /**
     * 搜索框模糊查询，可输入订单id，收货人手机号码，收货地址，订单日期，商品名称，买家姓名，卖家姓名进行查询
     * @param searchValue
     * @return
     */
    List<Order> AdminSearchOrder(String searchValue);

    List<Order> getMyBuyOrder(int userId);

    int delMyBuyOrder(int orderId);

    Map getMySellOrder(int userId);
}
