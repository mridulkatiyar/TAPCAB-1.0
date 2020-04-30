package com.niit.cab.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.niit.cab.model.Contact;



public interface ContactRepository extends JpaRepository<Contact, String> {

}
