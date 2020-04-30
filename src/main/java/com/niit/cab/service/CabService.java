package com.niit.cab.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.niit.cab.model.Cab;
import com.niit.cab.repository.CabRepository;

@Service
@Transactional
public class CabService {
	
	@Autowired 
	CabRepository cabRepo;
	
	public void save(Cab cab)
	{
		cabRepo.save(cab);
	}
	
	public Cab get(Long cabId)
	{
		return cabRepo.findById(cabId).get();
	}
	
	public List<Cab> listAll()
	{
		return cabRepo.findAll();
	}
	
	public void delete(Long cabId)
	{
		cabRepo.deleteById(cabId);
	}

}
