package com.niit.cab;

import javax.servlet.http.HttpServletRequest;

import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Spy;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;

import com.niit.cab.model.Passenger;
import com.niit.cab.rest.AdminPassengerRestController;
import com.niit.cab.service.CabBookingService;
import com.niit.cab.service.CabService;

public class AdminPassengerRestControllerTest {

	@InjectMocks
	AdminPassengerRestController adminPassengerRestController;
	
	@Mock
	private Passenger passenger;

	@Mock
	CabBookingService cabBookingService;

	@Mock
	CabService cabDetailsService;
	

	@Spy
	Model model;

	@Spy
	HttpServletRequest req;

	@Spy
	ModelMap modelMap;

	
	@Test
	public void getAllPassengerTest() {
		Passenger p1=new Passenger("9723110434","Priyanka","Female","pass","pt@gmail.com",1000);
		
		
		adminPassengerRestController.getAllPassenger();
	}
}
