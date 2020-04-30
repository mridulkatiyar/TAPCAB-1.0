package com.niit.cab.rest;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.niit.cab.exception.ResourceNotFoundException;
import com.niit.cab.model.CabBooking;
import com.niit.cab.model.CabBookingAddress;

import com.niit.cab.repository.CabBookingRepository;

@RestController  
@CrossOrigin(origins="http://localhost:4200")  
@RequestMapping(value="/bookingsApi") 
public class AdminCabBookingRestController {
	
	@Autowired
	CabBookingRepository cabBookingRepo;

	
	
	 @GetMapping("/listCabBooking") public List<CabBookingAddress> getAllBookings()
	  {  
		 
		 List <CabBookingAddress> reverseList=cabBookingRepo.fetchCabBookingInnerJoin();
		Collections.reverse(reverseList);
		
		return reverseList;
	  
	  } 
	 
	
		@PutMapping("/listCabBooking/{id}")
		public Map<String, Boolean> updateCab(@PathVariable(value = "id") Long cabBookingId,
				@Valid @RequestBody CabBooking cb) throws ResourceNotFoundException {

			CabBooking cabBooking = cabBookingRepo.findById(cabBookingId)
					.orElseThrow(() -> new ResourceNotFoundException("Cab Bookinng not found for this id :: " + cabBookingId));

			cabBooking.setCabId(cb.getCabId());
			cabBooking.setStatus(cb.getStatus());
			cabBooking.setFare(cb.getFare());


			cabBookingRepo.save(cabBooking);
		
			
			
			Map<String, Boolean> response = new HashMap<>();
			response.put("deleted", Boolean.TRUE);
			return response;
		}
}
