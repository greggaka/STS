package com.gregg.abstractdemo;

import com.gregg.abstractdemo.models.CashPayment;
import com.gregg.abstractdemo.models.CreditCardPayment;

public class AbstractDemoApplication {

	public static void main(String[] args) {
//		Payment pay = new Payment(2.2);
		CashPayment laptop = new CashPayment(1999.99);
//		laptop.paymentDetails();
		
		CreditCardPayment rp = new CreditCardPayment(100.00, "45624152", "Gregg", "12/22");
		rp.paymentDetails();
		

	}

}
