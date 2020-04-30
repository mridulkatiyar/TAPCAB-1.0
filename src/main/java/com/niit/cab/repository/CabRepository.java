package com.niit.cab.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.niit.cab.model.Cab;

public interface CabRepository extends JpaRepository<Cab, Long> {

}
