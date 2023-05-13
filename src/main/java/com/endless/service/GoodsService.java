package com.endless.service;

import com.endless.pojo.Goods;
import com.endless.pojo.Order;
import com.github.pagehelper.PageInfo;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

public interface GoodsService {


    List<Goods> recommendGoodsList();

    Goods findGood(int id);

    int findGoodStock(int id);

    List<Goods> findGoodsByType(String type);
    PageInfo<Goods> findGoodsByTypePage(Integer pageNum,String typeID);


    List<Goods> searchGoods(String searchGoodsName);


    /**
     * @return 读取表中有多少条数据
     */
    int selectGoodsColumn();

    /**
     * @return 商品表所有的信息
     */
    List<Goods> findAllGoods();


    /**
     * 传入要跳转到的页数
     * @param pageNum
     * @return 该页的数据
     */
    PageInfo<Goods> getGoodpage(Integer pageNum);
    /**
     * 传入要跳转到的页数
     * @param pageNum
     * @return 该页的数据
     */
    PageInfo<Goods> getGoodTypepage(Integer pageNum, int typeID);

    /**
     * 删除商品，传入删除的id
     * @param id
     * @return 成功true，失败或者其他false
     */
    Boolean AdminDeleteGoodsByid(int id);

    Order updateShopCart(Goods goods, Order order, int amount);

    /**
     * 搜索框模糊查询，输入商品命
     * @param searchValue
     * @return
     */
    List<Goods> AdminSearchGood(String searchValue);

    Map subOrder(HttpSession session, String address, String name, String phone);
    /**
     * 根据用户的id来获取该用户上架的商品
     * @param userid
     * @return
     */
    PageInfo<Goods> GetMyGoodsPage(Integer pageNum,int userid);

    List<Goods> hotGoodsList();

    /**
     * 删除商品，传入删除的id
     * @param id
     * @return 成功true，失败或者其他false
     */
    Boolean DeleteMyGoodsByid(int id);

    int modifyMyOrderGoodsStatus(int orderId);

    int modifyMyOrderGoodsStock(int orderId);

    int modifyMySellGoodsStock(int parseInt);

    String insertNewGoods(String goodsName,String suffix ,float parseFloat, String goodsIntro, int parseInt, String type, int userId);

    String editGoods(String goodsId, String goodsName, String suffix, float price, String goodsIntro, int stock, String type, int user);


}
