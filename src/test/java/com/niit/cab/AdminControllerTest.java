package com.niit.cab;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.sql.Date;
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
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;

import com.niit.cab.controller.AdminController;
import com.niit.cab.model.Address;
import com.niit.cab.model.Admin;
import com.niit.cab.model.Cab;
import com.niit.cab.model.CabBooking;
import com.niit.cab.model.Contact;
import com.niit.cab.service.CabBookingService;
import com.niit.cab.service.CabService;
import com.niit.cab.service.ContactService;
import com.niit.cab.service.PassengerService;


@RunWith(MockitoJUnitRunner.class)
@SpringBootTest(classes= {AdminController.class})
public class AdminControllerTest {
	@InjectMocks
	private AdminController adminController;

	@Mock
	private PassengerService passengerService;

	@Mock
	private CabBookingService cabBookingService;
	
	@Mock
	private ContactService contactService;

	@Mock
	private CabService cabDetailsService;

	@Spy
	private HttpSession ses;
	
	@Spy
	private Model model;

	@Spy
	private HttpServletRequest req;

	@Spy
	private ModelMap modelMap;
	
	@Spy
	private ModelAndView modelAndView;


	@Before
	public void init() {
		MockitoAnnotations.initMocks(this);
	}
	
	

	@Test
	public void saveBookingFareTest()
	{
		CabBooking cb=new CabBooking();
			
		when(req.getSession()).thenReturn(ses);
		when(req.getParameter("bookingId")).thenReturn("23");
		when(cabBookingService.get(23l)).thenReturn(cb);
		when(req.getParameter("fare")).thenReturn("400");
		when(cabDetailsService.listAll()).thenReturn(new ArrayList<Cab>());
		assertEquals(adminController.saveBookingFare(req, model), "cab-list");
		verify(cabBookingService,times(1)).saveBooking(cb);		
	}
	
	@Test
	public void deleteCapTest() {
	
		when(req.getSession()).thenReturn(ses);
		when(req.getParameter("cabId")).thenReturn("1");	
		assertEquals(adminController.deleteCab(req, modelMap), "redirect:/viewCabDetails");
	}
	
	@Test
	public void updateCapTest() {
		CabBooking cb=new CabBooking();
		when(req.getSession()).thenReturn(ses);
		when(req.getParameter("cabId")).thenReturn("1");
		when(cabBookingService.get(1l)).thenReturn(cb);
		assertEquals(adminController.updateCab(req, modelMap), "admin-set-cab");
	}
	
	@Test
	public void viewCabDetailsTest() {
		when(cabDetailsService.listAll()).thenReturn(new ArrayList<Cab>());
		assertEquals(adminController.viewCabDetails(model), "show-cab-list-for-update-delete");
		
	}
	
	
	@Test
	public void saveCabDetailsTest() {
		
		Cab cab=new Cab();
		assertEquals(adminController.saveCabDetails(cab, model), "redirect:/viewCabDetails");
		verify(cabDetailsService,times(1)).save(cab);	
	}
	
	@Test
	public void showCabDetailsFormTest()
	{

		Assert.assertEquals(adminController.showCabDetailsForm(), "admin-set-cab");

	}
	
	
	@Test
	public void rejectBookingRequestTest()
	{
		CabBooking cb=new CabBooking();
		when(req.getSession()).thenReturn(ses);
		when(req.getParameter("bookingId")).thenReturn("23");
		when(cabBookingService.get(23l)).thenReturn(cb);
		assertEquals(adminController.rejectBookingRequest(model, req), "redirect:/showBookingRequest");
		verify(cabBookingService,times(1)).saveBooking(cb);		
	}
	
	
	@Test
	public void assignCabTest()
	{
		when(req.getSession()).thenReturn(ses);
		when(req.getParameter("bookingId")).thenReturn("23");
		CabBooking cb=new CabBooking();
		when(cabBookingService.get(23l)).thenReturn(cb);
		when(req.getParameter("cabId")).thenReturn("1");	
			
		
			long cabId=1;
			String bookingId="2";
			assertEquals(adminController.assignCab(cabId, bookingId, model), "redirect:/showBookingRequest");
			verify(cabBookingService,times(1)).saveBooking(cb);
		
	}
	
	
	
	@Test
	public void setBookingStatusTest()
	{
		when(req.getSession()).thenReturn(ses);
		when(req.getParameter("bookingId")).thenReturn("1");
		CabBooking cabBooking=new CabBooking();
		cabBooking.setStatus("pending");
		if(cabBooking.getStatus().equals("pending")) {
			
		when(cabBookingService.get(1l)).thenReturn(cabBooking);
		assertEquals(adminController.setBookingStatus(req, modelMap), "set-booking-status-fare");}
		cabBooking.setStatus("pendin");
		if(cabBooking.getStatus().equals("pending")){}
		else{
			when(cabBookingService.listAll()).thenReturn(new ArrayList<CabBooking>());
		assertEquals(adminController.setBookingStatus(req, modelMap), "show-booking-request");
		}
	}
	
	
	
	@Test
	public void listBookingRequestTest()
	{
		when(cabDetailsService.listAll()).thenReturn(new ArrayList<Cab>());
		assertEquals(adminController.listBookingRequest(modelMap),"show-booking-request");
	}
	
	
	
	@Test
	public void listContactUsRequestTest()
	{
		when(contactService.listAll()).thenReturn(new ArrayList<Contact>());
		assertEquals(adminController.listContactUsRequest(modelMap), "listContactForm");
	}

	@Test
	public void deleteCustomerTest()
	{
		when(req.getSession()).thenReturn(ses);
		when(req.getParameter("phoneNo")).thenReturn("8009763896");
		assertEquals(adminController.deleteCustomer(req), "redirect:/passengerList");
	}
	

	@Test
	public void replyContactTest()
	{

		Assert.assertEquals(adminController.replyContactForm(), "redirect:/listContactUsForms");

	}




	@Test
	public void viewLoginFormTest()
	{

		Assert.assertEquals(adminController.viewLoginForm(), "login-admin");

	}

	@Test
	public void viewAdminHomeTest()
	{

		Assert.assertEquals(adminController.viewAdminHome(), "welcome-admin-page");

	}

	@Test
	public void listPassengerTest()
	{

		Assert.assertEquals(adminController.listPassenger(modelMap), "list-passenger");

	}

	@Test
	public void checkModelClassAddressCabBooking() {
		CabBooking cb=new CabBooking();
		Address a=new Address();
		a.setPickUpAddress("Kanpur");
		a.setPickUpCity("Kanpur");
		a.setPickUpPinCode(202020);
		a.setPickUpState("UP");

		a.setDestiAddress("Noida");
		a.setDestiCity("Noida");
		a.setDestiPinCode(20000);
		a.setDestiState("UP");
		
		cb.setAddress(a);
		cb.setBookingId(1l);
		cb.setCabId(1l);
		cb.setCarType("XUV");
		cb.setFare(100);
		cb.setName("Mridul");
		cb.setNumberOfPersons(1);
		cb.setPaymentMode("Wallet");
		cb.setPhoneNo("8009763896");
		cb.setPickUpDate(new Date(12/12/2012));
		cb.setPickUpTime("12:12 AM");
		cb.setStatus("Pending");
		
		cb.getBookingId();
		cb.getCabId();
		cb.getCarType();
		cb.getFare();
		cb.getName();
		cb.getNumberOfPersons();
		cb.getPaymentMode();
		cb.getPhoneNo();
		cb.getPickUpDate();
		cb.getPickUpTime();
		cb.getStatus();
		
		a.getAddressId();
		a.getCabBooking();
		a.getDestiAddress();
		a.getDestiCity();
		a.getDestiPinCode();
		a.getDestiState();
		a.getPickUpAddress();
		a.getPickUpAddress();
		a.getPickUpCity();
		a.getPickUpPinCode();
		a.getPickUpState();
	}

	@Test
	public void checkModelClassAdminAndCab() {
		Admin admin=new Admin();
		admin.setAdminId("Admin123");
		admin.setPassword("Admin123");
		
		admin.getAdminId();
		admin.getPassword();
		
		Cab cab=new Cab();
		cab.setCabColor("Red");
		cab.setCabDriverName("Ramlal");
		cab.setCabDriverPhoneNumber("9876543212");
		cab.setCabId(1l);
		cab.setCabName("Creta");
		cab.setCabRegistraionNumber("UP-78-BC-8055");
		
		cab.getCabColor();
		cab.getCabDriverName();
		cab.getCabDriverPhoneNumber();
		cab.getCabId();
		cab.getCabName();
		cab.getCabRegistraionNumber();
		
		
	}

}