package com.niit.cab.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.niit.cab.model.Passenger;
import com.niit.cab.repository.PassengerRepository;

@Service
@Transactional
public class PassengerService {

	@Autowired 
	PassengerRepository passengerRepo;

	public void save(Passenger passenger)
	{
		passengerRepo.save(passenger);
	}


	public List<Passenger> listAll()
	{
		return passengerRepo.findAll();
	}


	public Passenger get(String phoneNo)
	{
		return passengerRepo.findById(phoneNo).get();
	}
	
	
	public void delete(String phoneNo)
	{
		passengerRepo.deleteById(phoneNo);
	}

}
