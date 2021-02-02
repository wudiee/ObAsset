package com.ob.dto;

public class Property {
	private String id;
	private int stock;
	private int deposit;
	private int house;
	private int fund;
	private int bond;
	private int gold;
	private String regdate;
	
	@Override
	public String toString() {
		return "Property [id=" + id + ", stock=" + stock + ", deposit=" + deposit + ", house=" + house + ", fund="
				+ fund + ", bond=" + bond + ", gold=" + gold + ", regDate=" + regdate + "]";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public int getDeposit() {
		return deposit;
	}

	public void setDeposit(int deposit) {
		this.deposit = deposit;
	}

	public int getHouse() {
		return house;
	}

	public void setHouse(int house) {
		this.house = house;
	}

	public int getFund() {
		return fund;
	}

	public void setFund(int fund) {
		this.fund = fund;
	}

	public int getBond() {
		return bond;
	}

	public void setBond(int bond) {
		this.bond = bond;
	}

	public int getGold() {
		return gold;
	}

	public void setGold(int gold) {
		this.gold = gold;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
}
