package com.caresoft.clinicapp.models;

import java.util.ArrayList;
import java.util.Date;

import com.caresoft.clinicapp.interfaces.HIPAACompliantAdmin;
import com.caresoft.clinicapp.interfaces.HIPAACompliantUser;

public class AdminUser extends User implements HIPAACompliantUser, HIPAACompliantAdmin {
	//attributes
	private Integer employeeID;
	private String role;
	private ArrayList<String> securityIncidents;

	//constructor
	public AdminUser() {
		super();
		securityIncidents = new ArrayList<String> ();
	}
	
	public AdminUser(Integer id, String role) {
		super(id, role);
		securityIncidents = new ArrayList<String> ();
	}
	
	//interfaces
	@Override
	public ArrayList<String> reportSecurityIncidents() {
		return this.getSecurityIncidents();
	}

	@Override
	public boolean assignPin(int pin) {
		String str = Integer.toString(pin);
		int pinLength = str.length();
		if (pinLength >= 6) {
			this.setPin(pin);
			return true;
		}
		else {
			return false;
		}
	}

	@Override
	public boolean accessAuthorized(Integer id) {
		if (this.getId() == id) {
			return true;
		}
		else {
			this.authIncident();
			return false;
		}
	}
	
	//methods
	public void newIncident(String notes) {
		String report = String.format("Datetime Submitted: %s\nReported By ID: %s\nNotes: %s \n", new Date(), this.id, notes);
		securityIncidents.add(report);
	}
	
	public void authIncident() {
		String report = String.format("Datetime Submitted: %s\nID: %s\nNotes: %s\n", new Date(), this.id, "AUTHORIZATION ATTEMPT FAILED FOR THIS USER");
		securityIncidents.add(report);
	}

	//getters and setters
	public Integer getEmployeeID() {
		return employeeID;
	}

	public void setEmployeeID(Integer employeeID) {
		this.employeeID = employeeID;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public ArrayList<String> getSecurityIncidents() {
		return securityIncidents;
	}

	public void setSecurityIncidents(ArrayList<String> securityIncidents) {
		this.securityIncidents = securityIncidents;
	}
	
}
