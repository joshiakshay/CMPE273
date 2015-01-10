package com.JongoConnection;

import org.jongo.marshall.jackson.oid.ObjectId;

public class Product{
	@ObjectId
	private String _id;
	private int ProductID;
	private String Name;
	private String Image;
	private String Make;
	private String Model;
	private String Color;
	private String Description;
	private double Price;
	private String Type;
	private int StartDate;
	private int EndDate;
	private String Brand;
	private String Style;
	private String ItemCode;
	public int getProductID() {
		return ProductID;
	}
	public void setProductID(int productID) {
		ProductID = productID;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getImage() {
		return Image;
	}
	public void setImage(String image) {
		Image = image;
	}
	public String getMake() {
		return Make;
	}
	public void setMake(String make) {
		Make = make;
	}
	public String getModel() {
		return Model;
	}
	public void setModel(String model) {
		Model = model;
	}
	public String getColor() {
		return Color;
	}
	public void setColor(String color) {
		Color = color;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	public double getPrice() {
		return Price;
	}
	public void setPrice(double price) {
		Price = price;
	}
	public String getType() {
		return Type;
	}
	public void setType(String type) {
		Type = type;
	}
	public int getStartDate() {
		return StartDate;
	}
	public void setStartDate(int startDate) {
		StartDate = startDate;
	}
	public int getEndDate() {
		return EndDate;
	}
	public void setEndDate(int endDate) {
		EndDate = endDate;
	}
	public String getBrand() {
		return Brand;
	}
	public void setBrand(String brand) {
		Brand = brand;
	}
	public String getStyle() {
		return Style;
	}
	public void setStyle(String style) {
		Style = style;
	}
	public String getItemCode() {
		return ItemCode;
	}
	public void setItemCode(String itemCode) {
		ItemCode = itemCode;
	}
	public String get_id() {
		return _id;
	}
	public void set_id(String _id) {
		this._id = _id;
	}	
	
}
