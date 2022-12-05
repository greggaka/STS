package com.caresoft.clinicapp.models;

import java.util.ArrayList;
import java.util.Date;

import com.caresoft.clinicapp.interfaces.HIPAACompliantUser;

public class Physician extends User implements HIPAACompliantUser {
	private ArrayList<String> patientNotes;
	
	//constructor
	public Physician() {
		super();
	}
	
	public Physician(Integer id) {
		super(id);
	}
	
	//Interface
	@Override
	public boolean assignPin(int pin) {
		String str = Integer.toString(pin);
		int pinLength = str.length();
		if (pinLength != 4){
			return false;
		}
		else {
			this.setPin(pin);
			return true;
		}
	}
	
	@Override
	public boolean accessAuthorized(Integer id) {
		if (this.getId() == id) {
			return true;
		}
		else {
			return false;
		}
	}
	
	//methods
	public void newPatientNotes(String notes, String patientName, Date date) {
		String report = String.format(
				"Datetime Submitted: %s \n", date);
		report += String.format("Reported By ID: %s \n", this.id);
		report += String.format("Patient Name: %s \n", patientName);
		report += String.format("Notes: %s \n", notes);
		this.patientNotes.add(report);
	}

	//getters and setters
	public ArrayList<String> getPatientNotes() {
		return patientNotes;
	}

	public void setPatientNotes(ArrayList<String> patientNotes) {
		this.patientNotes = patientNotes;
	}
	
	

}
