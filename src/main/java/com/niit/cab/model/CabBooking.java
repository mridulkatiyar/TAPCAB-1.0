package com.niit.cab.model;

import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class CabBooking {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long bookingId;

	private String name;
	
	
	private String phoneNo;
	
	private String carType;
	private int numberOfPersons;
	private Date pickUpDate;
	private String pickUpTime;
	private int fare;
	private String status;
	
	@OneToOne(cascade =  CascadeType.ALL)
	private Address address; 
	
	
	private Long cabId; 
	
	private String paymentMode;
	private String feedback;
	boolean feedbackFlag;
	
	  
	public CabBooking() {}



	public Long getBookingId() {
		return bookingId;
	}



	public void setBookingId(Long bookingId) {
		this.bookingId = bookingId;
	}
	
	



	public boolean isFeedbackFlag() {
		return feedbackFlag;
	}



	public void setFeedbackFlag(boolean feedbackFlag) {
		this.feedbackFlag = feedbackFlag;
	}



	public String getFeedback() {
		return feedback;
	}



	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getPhoneNo() {
		return phoneNo;
	}



	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}



	public String getCarType() {
		return carType;
	}



	public void setCarType(String carType) {
		this.carType = carType;
	}



	public int getNumberOfPersons() {
		return numberOfPersons;
	}



	public void setNumberOfPersons(int numberOfPersons) {
		this.numberOfPersons = numberOfPersons;
	}



	public Date getPickUpDate() {
		return pickUpDate;
	}



	public void setPickUpDate(Date pickUpDate) {
		this.pickUpDate = pickUpDate;
	}



	


	public String getPickUpTime() {
		return pickUpTime;
	}



	public void setPickUpTime(String pickUpTime) {
		this.pickUpTime = pickUpTime;
	}



	public int getFare() {
		return fare;
	}



	public void setFare(int fare) {
		this.fare = fare;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String string) {
		this.status = string;
	}



	public Address getAddress() {
		return address;
	}



	public void setAddress(Address address) {
		this.address = address;
	}

	




	public Long getCabId() {
		return cabId;
	}



	public void setCabId(Long cabId) {
		this.cabId = cabId;
	}

	


	public String getPaymentMode() {
		return paymentMode;
	}



	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}
	
}
	
	
	
	