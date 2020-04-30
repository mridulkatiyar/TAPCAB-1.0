package com.niit.cab;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Spy;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.niit.cab.controller.PassengerController;
import com.niit.cab.model.Contact;
import com.niit.cab.model.Passenger;
import com.niit.cab.service.ContactService;
import com.niit.cab.service.PassengerService;

@RunWith(MockitoJUnitRunner.class)
@SpringBootTest(classes= {PassengerController.class})
public class PassengerControllerTest {

	@InjectMocks
	private PassengerController passengerController;

	@Mock
	private PassengerService passengerService;
	
	@Mock
	private ContactService contactService;

	@Spy
	private Model model;

	@Spy
	private HttpServletRequest req;

	@Spy
	private HttpSession ses;

	
	@Spy
	private ModelAndView modelAndView;
	
	
	@Test
	public void saveContactDetailsTest() {
		Contact contact=new Contact();
		assertEquals(passengerController.saveContactDetail(contact), "redirect:");
		verify(contactService,times(1)).save(contact);
		
	}


	@Test
	public void viewRegisterPageTest()
	{

		Assert.assertEquals(passengerController.registerUser(model), "register-form");

	}
	
	@Test
	public void saveCustomerTest()

	{	Passenger passenger =new Passenger();
		assertEquals(passengerController.saveCustomer(passenger, model), "register-form");
	}

	@Test
	public void payMethodTest()
	{	
		when(req.getSession()).thenReturn(ses);
		when(req.getParameter("phoneNo")).thenReturn("8009763896");
		when(req.getParameter("walletAmount")).thenReturn("100");
		Passenger passenger =new Passenger();
		when(passengerService.get("8009763896")).thenReturn(passenger);
		
		assertEquals(passengerController.payMethod(req, model), "my-info");
		verify(passengerService,times(1)).save(passenger);
	}

	
	@Test
	public void viewHomePageTest()
	{

		Assert.assertEquals(passengerController.viewHomePage(), "index"); 
	}

	@Test
	public void viewContactUsTest()
	{

		Assert.assertEquals(passengerController.viewContactUs(), "contact-us");

	}
	@Test
	public void viewLoginFormTest()
	{
		Passenger passenger=new Passenger();

		Assert.assertEquals(passengerController.viewLoginForm(passenger,model), "login-customer");

	}
	

	@Test
	public void viewAboutUsTest()
	{

		Assert.assertEquals(passengerController.viewAboutUs(), "about-us"); 
	}

	@Test
	public void showFormForMyInfo1Test()
	{

		when(req.getSession()).thenReturn(ses);
		when(req.getParameter("phoneNo")).thenReturn("8009763896");
		Passenger passenger =new Passenger();
		when(passengerService.get("8009763896")).thenReturn(passenger);
		Assert.assertEquals(passengerController.showFormForMyInfo1(req,model), "my-info");

	}
	
	@Test
	public void showFormForMyInfoTest()
	{

		when(req.getSession()).thenReturn(ses);
		when(req.getParameter("phoneNo")).thenReturn("8009763896");
		Passenger passenger =new Passenger();
		when(passengerService.get("8009763896")).thenReturn(passenger);
		Assert.assertEquals(passengerController.showFormForMyInfo(req,model), "update-info");

	}
	
	@Test
	public void showFormForMyInfoUpdateTest()
	{

		Passenger passenger =new Passenger();
		Assert.assertEquals(passengerController.showFormForMyInfoUpdate(passenger,model), "welcome-user-page");
		verify(passengerService,times(1)).save(passenger);
	}
	
	@Test
	public void showLoginHomeTest()
	{

		when(req.getSession()).thenReturn(ses);
		when(req.getParameter("phoneNo")).thenReturn("8009763896");
		Passenger passenger =new Passenger();
		when(passengerService.get("8009763896")).thenReturn(passenger);
		Assert.assertEquals(passengerController.showLoginHome(req,model), "welcome-user-page");

	}
	
	@Test
	public void afterLoginAboutUsTest()
	{

		when(req.getSession()).thenReturn(ses);
		when(req.getParameter("phoneNo")).thenReturn("8009763896");
		Passenger passenger =new Passenger();
		when(passengerService.get("8009763896")).thenReturn(passenger);
		Assert.assertEquals(passengerController.afterLoginAboutUs(req,model), "about-us-afterLogin");

	}
	
	@Test
	public void afterLoginContactUsTest()
	{

		when(req.getSession()).thenReturn(ses);
		when(req.getParameter("phoneNo")).thenReturn("8009763896");
		Passenger passenger =new Passenger();
		when(passengerService.get("8009763896")).thenReturn(passenger);
		Assert.assertEquals(passengerController.afterLoginContactUs(req,model), "contact-us-afterLogin");

	}
	
	@Test
	public void saveRegisteredUserContactDetailTest()
	{
		Contact contact=new Contact();
		assertEquals(passengerController.saveRegisteredUserContactDetail(contact, model), "welcome-user-page");
		verify(contactService,times(1)).save(contact);
	}
	
	
	@Test
	public void showPaymentGatwayFormTest()
	{

		Assert.assertEquals(passengerController.showPaymentGatwayForm(req,model), "payment-gateway");

	}

	@Test
	public void loginPassengerTest()
	{
		String phoneNo="9723110434";
		Passenger p=new Passenger();
		p.setPhoneNo("9723110434");
		p.setPassword("pass");
		when(passengerService.get(phoneNo)).thenReturn(p);

		Passenger x=passengerService.get(phoneNo);

		Assert.assertEquals(x.getPhoneNo(),"9723110434" );
		Assert.assertEquals(x.getPassword(),"cGFzcw==");

		//assertEquals(loginController.loginDealer(req,d,model1),"products");
		verify(passengerService,times(1)).get("9723110434");
		when(passengerService.get("9723110434")).thenReturn(p);
		
		Assert.assertEquals(passengerController.processLogin(p), modelAndView);
		
	}
	
	@Test
	public void checkModelClassPassenger() {
		Passenger p=new Passenger();
		p.setDOB(new Date(22/9/1996));
		p.setEmail("mk@gmail.com");
		p.setGender("Male");
		p.setName("Mridul");
		p.setPassword("pass");
		p.setPhoneNo("8009763896");
		p.setWalletAmount(100);
		
		p.getDOB();
		p.getEmail();
		p.getGender();
		p.getName();
		p.getPassword();
		p.getPhoneNo();
		p.getWalletAmount();
	}
	
	@Test
	public void checkModelClassContact(){
	Contact c=new Contact();
	c.setCheckReport("Mark");
	c.setCheckReportStatus("Mark");
	c.setContactId(1);
	c.setEmail("mk@gmail.com");
	c.setMessage("Hello There");
	c.setName("Mridul");
	c.setPhoneNo("8009763896");
	
	c.getCheckReport();
	c.getCheckReportStatus();
	c.getContactId();
	c.getEmail();
	c.getMessage();
	c.getName();
	c.getPhoneNo();
	}

	

}
