package com.niit.cab.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.niit.cab.model.CabBooking;
import com.niit.cab.repository.CabBookingRepository;

@Service
@Transactional
public class CabBookingService {
	
	@Autowired
	CabBookingRepository cabRepo;
	
	
	public void saveBooking(CabBooking cabBooking)
	{
		cabRepo.save(cabBooking);
	}

	public List<CabBooking> getMyTrips(String phoneNo)
	{
		return cabRepo.findByPhoneNo(phoneNo);
	}

	public List<CabBooking> listAll() {
		// TODO Auto-generated method stub
		return cabRepo.findAll();
	}

	public CabBooking get(Long bookingId) {
		// TODO Auto-generated method stub
		return cabRepo.findById(bookingId).get();
	}

	
}
