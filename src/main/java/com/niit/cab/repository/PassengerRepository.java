package com.niit.cab.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.niit.cab.model.Passenger;



public interface PassengerRepository extends JpaRepository<Passenger, String> {

}
