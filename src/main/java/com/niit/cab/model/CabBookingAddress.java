package com.niit.cab.model;

public class CabBookingAddress {

	private Long bookingId;

	private String name;
	private String phoneNo;

	private String carType;
	private int numberOfPersons;
//	private String pickUpDate;
	private String pickUpTime;
	private int fare;
	private String status;

	private Long cabId; 


	private String pickUpAddress;
	private String pickUpCity;
	private String pickUpState;
	private int pickUpPinCode;


	private String destiAddress;
	private String destiCity;
	private String destiState;
	private int destiPinCode;
	
	public CabBookingAddress() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CabBookingAddress(Long bookingId, String name, String phoneNo, String carType, int numberOfPersons,
			String pickUpTime, int fare, String status, Long cabId, String pickUpAddress, String pickUpCity,
			String pickUpState, int pickUpPinCode, String destiAddress, String destiCity, String destiState,
			int destiPinCode) {
		super();
		this.bookingId = bookingId;
		this.name = name;
		this.phoneNo = phoneNo;
		this.carType = carType;
		this.numberOfPersons = numberOfPersons;
		this.pickUpTime = pickUpTime;
		this.fare = fare;
		this.status = status;
		this.cabId = cabId;
		this.pickUpAddress = pickUpAddress;
		this.pickUpCity = pickUpCity;
		this.pickUpState = pickUpState;
		this.pickUpPinCode = pickUpPinCode;
		this.destiAddress = destiAddress;
		this.destiCity = destiCity;
		this.destiState = destiState;
		this.destiPinCode = destiPinCode;
	}

	public Long getBookingId() {
		return bookingId;
	}

	public void setBookingId(Long bookingId) {
		this.bookingId = bookingId;
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

	public void setStatus(String status) {
		this.status = status;
	}

	public Long getCabId() {
		return cabId;
	}

	public void setCabId(Long cabId) {
		this.cabId = cabId;
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
	
	
	

}
