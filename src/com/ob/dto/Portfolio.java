package com.ob.dto;

public class Portfolio {
	private double stock;
	private double deposit;
	private double house;
	private double fund;
	private double bond;
	private double gold;
	
	@Override
	public String toString() {
		return "Portfolio [stock=" + stock + ", deposit=" + deposit + ", house=" + house + ", fund=" + fund + ", bond="
				+ bond + ", gold=" + gold + "]";
	}

	public double getStock() {
		return stock;
	}

	public void setStock(double stock) {
		this.stock = stock;
	}

	public double getDeposit() {
		return deposit;
	}

	public void setDeposit(double deposit) {
		this.deposit = deposit;
	}

	public double getHouse() {
		return house;
	}

	public void setHouse(double house) {
		this.house = house;
	}

	public double getFund() {
		return fund;
	}

	public void setFund(double fund) {
		this.fund = fund;
	}

	public double getBond() {
		return bond;
	}

	public void setBond(double bond) {
		this.bond = bond;
	}

	public double getGold() {
		return gold;
	}

	public void setGold(double gold) {
		this.gold = gold;
	}
	
	
}
