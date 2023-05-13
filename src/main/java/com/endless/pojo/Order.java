package com.endless.pojo;

import com.endless.utils.PriceUtils;
import com.fasterxml.jackson.annotation.JsonFormat;


import javax.servlet.http.HttpSession;
import java.util.*;

public class Order {
    private int id;//订单id
    private float total;//总价，即所有订单项的商品数量amount乘以商品单价price的总和
    private int amount;// 商品总数量，所有订单项的商品数量amount的总和
    private int status;//用户订单状态，1已付款/2已发货/3已完成
    private String name;//用户姓名(收货人姓名)
    private String phone;//用户电话（收货电话）
    private String address;//用户地址（收货地址）
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date datetime;//用户订单日期
//    private User saleUser;//卖家用户对象，sale_id
    private User buyUser;//买家用户对象，buy_id
    private Map<Integer,OrderItem> itemMap = new LinkedHashMap<>();
    private List<OrderItem> itemList = new ArrayList<OrderItem>();


//    public User getSaleUser() {
//        return saleUser;
//    }
//
//    public void setSaleUser(User saleUser) {
//        this.saleUser = saleUser;
//    }

    public User getBuyUser() {
        return buyUser;
    }

    public void setBuyUser(User buyUser) {
        this.buyUser = buyUser;
    }

    public void addGoods(Goods g,int amount) {
        if(itemMap.containsKey(g.getId())) {
            OrderItem item = itemMap.get(g.getId());
            item.setAmount(item.getAmount()+amount);
            this.amount = this.amount + amount ;
            total = PriceUtils.add(total, g.getPrice()*amount);
        }else {
            OrderItem item = new OrderItem(g.getPrice(),amount,g,this);
            item.setGoodsName(g.getName());
            itemMap.put(g.getId(), item);
            this.amount = this.amount + amount;
            total = PriceUtils.add(total, g.getPrice()*amount);
        }
    }

    public List<OrderItem> getItemList() {
        return itemList;
    }

    public void setItemList(List<OrderItem> itemList) {
        this.itemList = itemList;
    }

    public void lessen(int goodsid) {
        if(itemMap.containsKey(goodsid)) {
            OrderItem item = itemMap.get(goodsid);
            item.setAmount(item.getAmount()-1);
            amount--;
            total = PriceUtils.subtract(total, item.getPrice());
            if(item.getAmount()<=0) {
                itemMap.remove(goodsid);
            }
        }
    }
    public void delete(int goodsid)
    {
        if(itemMap.containsKey(goodsid)) {
            OrderItem item = itemMap.get(goodsid);
            total = PriceUtils.subtract(total, item.getAmount()*item.getPrice());
            amount-=item.getAmount();
            itemMap.remove(goodsid);
        }
    }

    public Map<Integer, OrderItem> getItemMap() {
        return itemMap;
    }

    public void setItemMap(Map<Integer, OrderItem> itemMap) {
        this.itemMap = itemMap;
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public float getTotal() {
        return total;
    }
    public void setTotal(float total) {
        this.total = total;
    }
    public int getAmount() {
        return amount;
    }
    public void setAmount(int amount) {
        this.amount = amount;
    }
    public int getStatus() {
        return status;
    }
    public void setStatus(int status) {
        this.status = status;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public Date getDatetime() {
        return datetime;
    }
    public void setDatetime(Date datetime) {
        this.datetime = datetime;
    }
    public Order() {
        super();
    }


}
