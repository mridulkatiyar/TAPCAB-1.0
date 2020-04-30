package com.niit.cab.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="address")
public class Address {
	
	@Id  
	@GeneratedValue(strategy=GenerationType.IDENTITY) 
	private Long addressId; 
		
	private String pickUpAddress;
	private String pickUpCity;
	private String pickUpState;
	private int pickUpPinCode;
	

	private String destiAddress;
	private String destiCity;
	private String destiState;
	private int destiPinCode;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "booking_Id")
	private CabBooking cabBooking;
	
	
	public Address() {}


	public Long getAddressId() {
		return addressId;
	}


	public void setAddressId(Long addressId) {
		this.addressId = addressId;
	}


	public String getPickUpAddress() {
		return pickUpAddress;
	}


	public void setPickUpAddress(String pickUpAddress) {
		this.pickUpAddress = pickUpAddress;
	}


	public String getPickUpCity() {
		return pickUpCity;
	}


	public void setPickUpCity(String pickUpCity) {
		this.pickUpCity = pickUpCity;
	}


	public String getPickUpState() {
		return pickUpState;
	}


	public void setPickUpState(String pickUpState) {
		this.pickUpState = pickUpState;
	}


	public int getPickUpPinCode() {
		return pickUpPinCode;
	}


	public void setPickUpPinCode(int pickUpPinCode) {
		this.pickUpPinCode = pickUpPinCode;
	}


	public String getDestiAddress() {
		return destiAddress;
	}


	public void setDestiAddress(String destiAddress) {
		this.destiAddress = destiAddress;
	}


	public String getDestiCity() {
		return destiCity;
	}


	public void setDestiCity(String destiCity) {
		this.destiCity = destiCity;
	}


	public String getDestiState() {
		return destiState;
	}


	public void setDestiState(String destiState) {
		this.destiState = destiState;
	}


	public int getDestiPinCode() {
		return destiPinCode;
	}


	public void setDestiPinCode(int destiPinCode) {
		this.destiPinCode = destiPinCode;
	}


	public CabBooking getCabBooking() {
		return cabBooking;
	}


	public void setCabBooking(CabBooking cabBooking) {
		this.cabBooking = cabBooking;
	}
	
	
	
	
	
	
	
}
