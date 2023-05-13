package com.endless.pojo;

public class Goods {
	private int id;//商品id
	private String name;//商品名称
	private String image;//商品图片
	private float price;//商品价格
	private String intro;//商品描述
	private int stock;//商品库存
	private Type type;//商品类型对象，type_id
	private User user;//用户对象，user_id

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setTypeid(int typeid) {
		if(type==null) {
			type = new Type();
		}
		type.setId(typeid);
	}
	public void setTypename(String typename) {
		if(type==null) {
			type = new Type();
		}
		type.setName(typename);
	}

	@Override
	public String toString() {
		return "Goods{" +
				"id=" + id +
				", name='" + name + '\'' +
				", image='" + image + '\'' +
				", price=" + price +
				", intro='" + intro + '\'' +
				", stock=" + stock +
				", type=" + type +
				", user=" + user +
				'}';
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public Type getType() {
		return type;
	}
	public void setType(Type type) {
		this.type = type;
	}
	public Goods() {
		super();
	}
	public Goods(int id, String name, String image, float price, String intro, int stock,
                 Type type) {
		super();
		this.id = id;
		this.name = name;
		this.image = image;
		this.price = price;
		this.intro = intro;
		this.stock = stock;
		this.type = type;
	}
	
	
}
