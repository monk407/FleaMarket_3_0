package com.endless.dao;

import com.endless.pojo.OrderItem;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderItemDao {


    List<OrderItem> SelectGoodidItem(@Param("goodid")int goodid);;

    int deleteItem(@Param("orderid")int orderid);

    int Updategoodid(@Param("orderitemid")int orderitemid);

    //删除订单项信息
    int AdminDeleteOrderItem(@Param("id") int id);

    int addSubOrderOrderItem(@Param("price") float oiPrice,@Param("amount") int oiAmount,@Param("goods_id") Integer key,@Param("order_id") int newOrderId);


    List<OrderItem> getMyBuyOrderItem(@Param("orderId") int id);

    int delMyBuyOrderItem(@Param("order_id") int orderId);

    List<OrderItem> getMySellOrder(@Param("userId") int userId);
}
