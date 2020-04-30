package com.niit.cab.model;

import java.nio.charset.StandardCharsets;
import java.sql.Date;
import java.util.Base64;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="user")
public class Passenger {


	@Id
	@Column(name="phone_no")
	private String phoneNo;

	
	private String name;

	@Column(name="gender")
	private String gender;

	@Column(name="password")
	private String password;

	@Column(name="DOB")
	private Date DOB;

	@Column(name="email")
	private String email;


	private int walletAmount;






	public Passenger() {}
	
	



	public Passenger(String phoneNo, String name, String gender, String password, String email,
			int walletAmount) {
		super();
		this.phoneNo = phoneNo;
		this.name = name;
		this.gender = gender;
		this.password = password;

		this.email = email;
		this.walletAmount = walletAmount;
	}





	public int getWalletAmount() {
		return walletAmount;
	}



	public void setWalletAmount(int walletAmount) {
		this.walletAmount = walletAmount;
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		Base64.Encoder encode=Base64.getEncoder();
		String normalString=password;
		String encodedString=encode.encodeToString(normalString .getBytes(StandardCharsets.UTF_8));
		this.password = encodedString;
	}

	public Date getDOB() {
		return DOB;
	}

	public void setDOB(Date dOB) {
		DOB = dOB;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "Passenger [phoneNo=" + phoneNo + ", name=" + name + ", gender=" + gender + ", password=" + password
				+ ", DOB=" + DOB + ", email=" + email + ", wallet=" + walletAmount + "]";
	}
}
