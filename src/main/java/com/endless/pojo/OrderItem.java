package com.endless.pojo;

public class OrderItem {
    private int id;//订单项id
    private float price;//商品单价
    private int amount;//商品数量
    private String goodsName;//商品名称
    private Goods goods;//商品对象，goods_id
    private Order order;// 订单对象，order_id

    public void setName(String name) {
        this.goodsName=name;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public float getPrice() {
        return price;
    }
    public void setPrice(float price) {
        this.price = price;
    }
    public int getAmount() {
        return amount;
    }
    public void setAmount(int amount) {
        this.amount = amount;
    }
    public Goods getGoods() {
        return goods;
    }
    public void setGoods(Goods goods) {
        this.goods = goods;
    }
    public Order getOrder() {
        return order;
    }
    public void setOrder(Order order) {
        this.order = order;
    }
    public OrderItem() {
        super();
    }
    public OrderItem(float price, int amount, Goods goods, Order order) {
        super();
        this.price = price;
        this.amount = amount;
        this.goods = goods;
        this.order = order;
    }
}
