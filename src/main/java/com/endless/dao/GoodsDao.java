package com.endless.dao;

import com.endless.pojo.Goods;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GoodsDao {
    List<Goods> recommendGoodsList(@Param("count") int count);

    int totalGoodsCount();

    Goods findGood(@Param("id") int id);

    int findGoodStock(@Param("id") int id);

    List<Goods> findAllGoods();

    List<Goods> findGoodsByType(@Param("type_id") int type_id);

    List<Goods> searchGoods(@Param("searchGoodsName") String searchGoodsName);

    //    CYJ！！！！！！！！！！！！！！！！！！！！
//查询所有的商品信息
    List<Goods> SelectAllGoods();
    //    根据商品id来删除商品
    int AdminDeleteGood(@Param("id") int id);

    List<Goods> SelectAllTypeGoods(@Param("typeID") int typeID);

    //根据userid查询该用户的商品信息
    List<Goods> SelectUseridGoods(@Param("userid") int userid);
    int deletegoods(@Param("goodid") int goodid);

    //    CYJ！！！！！！！！！！！！！！！！！！！！

    //读取表中有多少条数据
    int selectGoodsColumn();

    //更改good中的typeid
    int UpdateTypeid(@Param("typeid")int typeid);

    List<Goods> AdminSearchGood(@Param("searchValue") String searchValue);

    int subStockInCart(@Param("id") Integer key,@Param("stock") int i);

    List<Goods> gethotGoodsList();

    int modifyMyOrderGoodsStatus(@Param("id") int orderId);

    List<Goods> findGoodStockByOrderId(@Param("orderId") int orderId);

    int modifyMyOrderGoodsStock(@Param("stock") int goodStock,@Param("id") int id);

    int modifyMySellGoodsStatus(int parseInt);

    int findLateGoodId();

    int insertNewGoods(@Param("goodsName") String goodsName,@Param("image") String filename,@Param("price") float parseFloat,@Param("intro") String goodsIntro,@Param("stock") int parseInt,@Param("type_id") int type_id,@Param("user_id") int userId);

    int editGoods(@Param("id") int parseInt,@Param("name") String goodsName,@Param("image") String image,@Param("price") float price,@Param("intro") String goodsIntro,@Param("stock") int stock,@Param("type_id") int type_id,@Param("user_id") int user);
}
