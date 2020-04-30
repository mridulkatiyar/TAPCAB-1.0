package com.niit.cab.rest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.niit.cab.model.Cab;
import com.niit.cab.repository.CabRepository;
import com.niit.cab.exception.ResourceNotFoundException;

@RestController  
@CrossOrigin(origins="http://localhost:4200")  
@RequestMapping(value="/api") 
public class AdminCabRestController {

	@Autowired
	CabRepository cabRepo;


	@GetMapping("/listCab")  
	public List<Cab> getAllCabs() {  
		return cabRepo.findAll();    
	}  


	/** 
	 * ResponseEntity represents an HTTP response, including headers, body, and status.
	 */
	@GetMapping("/listCab/{id}")
	public ResponseEntity<Cab> getCabById(@PathVariable(value = "id") Long cId)
			throws ResourceNotFoundException {
		Cab cab = cabRepo.findById(cId)
				.orElseThrow(() -> new ResourceNotFoundException("Cab not found for this id :: " + cId));
		return ResponseEntity.ok().body(cab);
	}

	@PostMapping("/listCab")  
	public Cab saveCab(@Valid @RequestBody Cab cab) {  
		return cabRepo.save(cab)  ;

	}  

	@DeleteMapping("/listCab/{id}")
	public Map<String, Boolean> deleteCab(@PathVariable(value = "id") Long cId) 
			throws ResourceNotFoundException{
		Cab cab = cabRepo.findById(cId)
				.orElseThrow(() -> new ResourceNotFoundException("Cab not found for this id :: " + cId));
		cabRepo.delete(cab);

		Map<String, Boolean> response = new HashMap<>();
		response.put("deleted", Boolean.TRUE);
		return response;
	}

	@PutMapping("/listCab/{id}")
	public ResponseEntity<Cab> updateCab(@PathVariable(value = "id") Long cId,
			@Valid @RequestBody Cab c) throws ResourceNotFoundException {

		Cab cab = cabRepo.findById(cId)
				.orElseThrow(() -> new ResourceNotFoundException("Cab not found for this id :: " + cId));

		cab.setCabName(c.getCabName());
		cab.setCabColor(c.getCabColor());
		cab.setCabDriverName(c.getCabDriverName());
		cab.setCabDriverPhoneNumber(c.getCabDriverPhoneNumber());
		cab.setCabRegistraionNumber(c.getCabRegistraionNumber());

		final Cab updatedCab = cabRepo.save(cab);
		return ResponseEntity.ok(updatedCab);
	}
}
