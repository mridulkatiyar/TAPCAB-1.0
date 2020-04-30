package com.niit.cab;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.Spy;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.niit.cab.controller.BookingController;
import com.niit.cab.model.Cab;
import com.niit.cab.model.CabBooking;
import com.niit.cab.model.CabBookingAddress;
import com.niit.cab.model.Passenger;
import com.niit.cab.service.CabBookingService;
import com.niit.cab.service.CabService;
import com.niit.cab.service.PassengerService;

@RunWith(MockitoJUnitRunner.class)
@SpringBootTest(classes= {BookingController.class})
public class BookingControllerTest {


	@InjectMocks
	private BookingController bookingController;

	@Mock
	private PassengerService passengerService;

	@Mock
	private CabBookingService cabService;

	@Mock
	private CabService cabDetailsService;

	@Spy
	private Model model;

	@Spy
	private HttpServletRequest req;

	@Spy
	private HttpSession ses;

	
	@Spy
	private ModelAndView modelView;
	
	@Before
	public void init() {
		MockitoAnnotations.initMocks(this);
	}

	@Test
	public void viewBookingFormTest()
	{
		
		when(req.getSession()).thenReturn(ses);
		when(req.getParameter("phoneNo")).thenReturn("8009763896");
		Passenger passenger =new Passenger();
		when(passengerService.get("8009763896")).thenReturn(passenger);
		Assert.assertEquals(bookingController.viewBookingForm(req,model),"cab-booking-form");

	}

	@Test
	public void listMyTripsTest()
	{
		when(req.getSession()).thenReturn(ses);
		when(req.getParameter("phoneNo")).thenReturn("8009763896");
		Passenger passenger =new Passenger();
		when(passengerService.get("8009763896")).thenReturn(passenger);
		when(cabService.getMyTrips("8009763896")).thenReturn(new ArrayList<CabBooking>());
		Assert.assertEquals(bookingController.listMyTrips(model,req), "my-trips");

	}

	@Test
	public void allDetailTest()
	{

		when(req.getSession()).thenReturn(ses);
		when(req.getParameter("bookingId")).thenReturn("1");
		when(cabService.get(1l)).thenReturn(new CabBooking());

		when(passengerService.get("8009763896")).thenReturn(new Passenger());
		
		when(cabDetailsService.get(1l)).thenReturn(new Cab());
		
		Assert.assertEquals(bookingController.allDetail(req,model), "pending-cab-detail");

	}

	@Test
	public void acceptRideTest()
	{
		when(req.getSession()).thenReturn(ses);
		when(req.getParameter("phoneNo")).thenReturn("8009763896");
		when(passengerService.get("8009763896")).thenReturn(new Passenger());
		
		when(req.getParameter("paymentMode")).thenReturn("TAP-CAB WALLE");
		
		when(req.getParameter("bookingId")).thenReturn("1");
		
		CabBooking cabBooking= new CabBooking();
		when(cabService.get(1l)).thenReturn(cabBooking);
		
		
		
		when(cabService.getMyTrips("8009763896")).thenReturn(new ArrayList<CabBooking>());
		
		
		assertEquals(bookingController.acceptRide(model, req), "my-trips");
		
		verify(cabService,times(1)).saveBooking(cabBooking);
	}

	@Test
	public void cancelRideTest()
	{
		when(req.getSession()).thenReturn(ses);
		when(req.getParameter("bookingId")).thenReturn("1");
		
		CabBooking cabBooking= new CabBooking();
		when(cabService.get(1l)).thenReturn(cabBooking);
		
		when(req.getParameter("phoneNo")).thenReturn("8009763896");
		when(passengerService.get("8009763896")).thenReturn(new Passenger());
		
	
		
		assertEquals(bookingController.cancelRide(model, req), "welcome-user-page");
		verify(cabService,times(1)).saveBooking(cabBooking);

	}


	
	@Test
	public void bookCabTest()
	{
		Passenger passenger =new Passenger();
		
		when(req.getSession()).thenReturn(ses);
		when(req.getParameter("phoneNo")).thenReturn("8009763896");
		when(passengerService.get("8009763896")).thenReturn(passenger);
		
		when(req.getParameter("pickUpAddress")).thenReturn("SHIPRA SUN CITY");
		when(req.getParameter("pickUpCity")).thenReturn("Delhi");
		when(req.getParameter("pickUpState")).thenReturn("Delhi");
		when(req.getParameter("pickUpPinCode")).thenReturn("200000");
		when(req.getParameter("destiAddress")).thenReturn("street1");
		when(req.getParameter("destiCity")).thenReturn("kanpur");
		when(req.getParameter("destiState")).thenReturn("UP");
		when(req.getParameter("destiPinCode")).thenReturn("202020");
//		
		CabBooking cabBooking=new CabBooking();
//		
//		
//
//		Address a=new Address();
//		a.setPickUpAddress("kanpur");
//		a.setPickUpCity("kanpur");
//		a.setPickUpState("UP");
//		a.setPickUpPinCode(20000);
//
//		a.setDestiAddress("Delhi");
//		a.setDestiCity("Delhi");
//		a.setDestiState("Delhi");
//		a.setDestiPinCode(202020);
//    	a.setCabBooking(cabBooking);
      //	cabBooking.setAddress(a);
//		cabBooking.setFare(0);
//		cabBooking.setStatus("pending");
//		cabBooking.setPhoneNo("8009763896");
//		cabBooking.setBookingId(1l);

		
		

		Assert.assertEquals(bookingController.bookCab(req, cabBooking, model),"my-trips");
		//when(cabService.getMyTrips("8009763896")).thenReturn(new ArrayList<CabBooking>());
		//verify(cabService,times(1)).saveBooking(cabBooking);
		
	}
//	
	@Test
	public void checkModelClassAddressCabBookingAddress() {
		CabBookingAddress cba=new CabBookingAddress();
		cba=new CabBookingAddress(1l,"name","890","xuv",1,"12:12",123,"status",1l,"kanpur","kanpur","UP",123456,"kanpur","kanpur","UP",123456);
		cba.setPickUpAddress("Kanpur");
		cba.setPickUpCity("Kanpur");
		cba.setPickUpPinCode(202020);
		cba.setPickUpState("UP");

		cba.setDestiAddress("Noida");
		cba.setDestiCity("Noida");
		cba.setDestiPinCode(20000);
		cba.setDestiState("UP");
		
		
		cba.setBookingId(1l);
		cba.setCabId(1l);
		cba.setCarType("XUV");
		cba.setFare(100);
		cba.setName("Mridul");
		cba.setNumberOfPersons(1);
		
		cba.setPhoneNo("8009763896");
		
		cba.setPickUpTime("12:12 AM");
		cba.setStatus("Pending");
		
		cba.getBookingId();
		cba.getCabId();
		cba.getCarType();
		cba.getFare();
		cba.getName();
		cba.getNumberOfPersons();
		
		cba.getPhoneNo();
		
		cba.getPickUpTime();
		cba.getStatus();
		
		
		cba.getDestiAddress();
		cba.getDestiCity();
		cba.getDestiPinCode();
		cba.getDestiState();
		cba.getPickUpAddress();
		cba.getPickUpAddress();
		cba.getPickUpCity();
		cba.getPickUpPinCode();
		cba.getPickUpState();
	}
}
