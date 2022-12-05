package com.gregg.abstractdemo.abstracts;

public abstract class Payment {
	//attributes
	private double amount;
	
	public Payment(double amount) {
		this.amount = amount;
	}
	
	public void paymentDetails() {
		System.out.println("Payment amount: " + this.amount);
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	
}
