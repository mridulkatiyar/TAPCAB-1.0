package com.niit.cab.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.niit.cab.model.Contact;
import com.niit.cab.repository.ContactRepository;

@Service
@Transactional
public class ContactService {
	
	@Autowired 
	ContactRepository contactRepo;
	
	public void save(Contact contact)
	{
		contactRepo.save(contact);
	}
	
	public Contact get(String contactId)
	{
		return contactRepo.findById(contactId).get();
	}
	
	public List<Contact> listAll()
	{
		return contactRepo.findAll();
	}
}
