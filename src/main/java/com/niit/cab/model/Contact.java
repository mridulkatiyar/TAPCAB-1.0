package com.niit.cab.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="contact")
public class Contact {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int contactId;
	
	private String name;
	private String phoneNo;
	private String email;
	private String message;
	private String checkReport;
	private String checkReportStatus;

	public Contact() {
	}

	public int getContactId() {
		return contactId;
	}

	public void setContactId(int contactId) {
		this.contactId = contactId;
	}

	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getCheckReport() {
		return checkReport;
	}

	public void setCheckReport(String checkReport) {
		this.checkReport = checkReport;
	}

	public String getCheckReportStatus() {
		return checkReportStatus;
	}

	public void setCheckReportStatus(String checkReportStatus) {
		this.checkReportStatus = checkReportStatus;
	}
	
}
