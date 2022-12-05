package com.gregg.abstractdemo.models;

import com.gregg.abstractdemo.abstracts.Payment;

public class CashPayment extends Payment {

	public CashPayment(double amount) {
		super(amount);
	}

}
