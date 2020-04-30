package com.niit.cab.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.niit.cab.model.CabBooking;
import com.niit.cab.model.CabBookingAddress;

public interface CabBookingRepository extends JpaRepository<CabBooking, Long> {

	List<CabBooking> findByPhoneNo(String phoneNo);


	@Query("SELECT new com.niit.cab.model.CabBookingAddress(c.bookingId,c.name,c.phoneNo,c.carType,c.numberOfPersons,c.pickUpTime,c.fare,c.status,c.cabId,"
			+
			"a.pickUpAddress,a.pickUpCity,a.pickUpState,a.pickUpPinCode,a.destiAddress,a.destiCity,a.destiState,a.destiPinCode)"
			+ "FROM CabBooking c INNER JOIN c.address a") List<CabBookingAddress>
	fetchCabBookingInnerJoin();
}