package com.gregg.abstractdemo.models;

import com.gregg.abstractdemo.abstracts.Payment;

public class CreditCardPayment extends Payment {
	//attributes
	private String cardNum, ownerName, expDate;
	
	public CreditCardPayment(double amount, String cardNum, String ownerName, String expDate) {
		super(amount);
		this.cardNum = cardNum;
		this.ownerName = ownerName;
		this.expDate = expDate;
	}

	@Override
	public void paymentDetails() {
		super.paymentDetails();
		System.out.println("CardNum: " + this.cardNum + " | Owner: " + this.ownerName + " | Exp Date: " + this.expDate);
	}
}
