package com.niit.cab.rest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.niit.cab.exception.ResourceNotFoundException;
import com.niit.cab.model.Passenger;
import com.niit.cab.repository.PassengerRepository;

@RestController  
@CrossOrigin(origins="http://localhost:4200")  
@RequestMapping(value="/PassengerApi") 
public class AdminPassengerRestController {
	
	@Autowired
	PassengerRepository pRepo;
	
	
	@GetMapping("/listPassenger")  
	public List<Passenger> getAllPassenger() {  
		return pRepo.findAll();    
	}  
	
	
	@DeleteMapping("/listPassenger/{phoneNo}")
	public Map<String, Boolean> deletePasssenger(@PathVariable(value = "phoneNo") String phoneNo) 
			throws ResourceNotFoundException{
		Passenger  passenger= pRepo.findById(phoneNo)
				.orElseThrow(() -> new ResourceNotFoundException("Passenger not found for this Phone No :: " + phoneNo));
		pRepo.delete(passenger);

		Map<String, Boolean> response = new HashMap<>();
		response.put("deleted", Boolean.TRUE);
		return response;
	}

}
