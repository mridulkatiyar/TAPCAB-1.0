package com.niit.cab.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Cab {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long cabId;
	
	private String cabName;
	private String cabRegistraionNumber;

	private String cabColor;

	private String cabDriverName;
	
	private String cabDriverPhoneNumber;


	public Cab() {
		}


	

	public Long getCabId() {
		return cabId;
	}




	public void setCabId(Long cabId) {
		this.cabId = cabId;
	}




	public String getCabName() {
		return cabName;
	}

	public void setCabName(String cabName) {
		this.cabName = cabName;
	}

	public String getCabRegistraionNumber() {
		return cabRegistraionNumber;
	}

	public void setCabRegistraionNumber(String cabRegistraionNumber) {
		this.cabRegistraionNumber = cabRegistraionNumber;
	}

	public String getCabColor() {
		return cabColor;
	}

	public void setCabColor(String cabColor) {
		this.cabColor = cabColor;
	}

	public String getCabDriverName() {
		return cabDriverName;
	}

	public void setCabDriverName(String cabDriverName) {
		this.cabDriverName = cabDriverName;
	}

	public String getCabDriverPhoneNumber() {
		return cabDriverPhoneNumber;
	}

	public void setCabDriverPhoneNumber(String cabDriverPhoneNumber) {
		this.cabDriverPhoneNumber = cabDriverPhoneNumber;
	}




	@Override
	public String toString() {
		return "Cab [cabId=" + cabId + ", cabName=" + cabName + ", cabRegistraionNumber=" + cabRegistraionNumber
				+ ", cabColor=" + cabColor + ", cabDriverName=" + cabDriverName + ", cabDriverPhoneNumber="
				+ cabDriverPhoneNumber + "]";
	}
	
	
	
	
}
