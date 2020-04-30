package com.niit.cab.controller;

import java.util.NoSuchElementException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.cab.model.Contact;
import com.niit.cab.model.Passenger;
import com.niit.cab.service.ContactService;
import com.niit.cab.service.PassengerService;

@Controller
public class PassengerController {									//Passenger Controller for Performing CRUD Operations


	@Autowired
	PassengerService passengerService;

	@Autowired
	ContactService contactService;

	/*********************************************Show Index/Home/About/Contact Page ********************************************************/

	@GetMapping("/TapCab")
	public String viewHomePage()
	{
		
		return "index";
	}

	@GetMapping("/aboutUs")
	public String viewAboutUs()
	{	
		return "about-us";
	}


	@GetMapping("/contactUs")
	public String viewContactUs()
	{	
		return "contact-us";
	}

	/*********************************************Save Contact Page in Database********************************************************/


	@RequestMapping(value = "/saveContact", method= {RequestMethod.GET,RequestMethod.POST})
	public String saveContactDetail(@ModelAttribute ("contact") Contact contact)
	{ 
		contact.setCheckReportStatus("Pending");
		contact.setCheckReport("?");
		contactService.save(contact);
		return "redirect:";
	}



	/*********************************************Showing An User Registration Form*********************************************/
	@RequestMapping("/registerUser")
	public String registerUser(Model model)
	{
		Passenger passenger=new Passenger();
		model.addAttribute("passenger", passenger);
		return "register-form";

	}

	/*********************************************Save An User Registration Details********************************************************/

	@RequestMapping(value = "/saveCustomer", method = RequestMethod.POST)
	public String saveCustomer(@ModelAttribute ("passenger") Passenger passenger,Model model)
	{
		try {
		passengerService.get(passenger.getPhoneNo());
		String error="User Phone Number Already Exist";
		model.addAttribute("error", error);
		return "register-form";
		}
		catch(NoSuchElementException e) {	
				passenger.setWalletAmount(0);
				passengerService.save(passenger);
				model.addAttribute("passenger", passenger);
				return "login-customer";
		}
		
	}

	/*********************************************Showing Login Form********************************************************/

	@RequestMapping(value = "/loginForm", method = {RequestMethod.POST, RequestMethod.GET})
	public String viewLoginForm(@ModelAttribute ("passenger") Passenger thePassenger,Model model)
	{ 

		model.addAttribute("passenger",thePassenger);
		return "login-customer";
	}

	/*********************************************Credential Checker/Login Method********************************************************/

	@RequestMapping(value = "/loginUser",  method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView processLogin(@ModelAttribute  Passenger thePassenger) {

		ModelAndView model = null;	

		try  
		{

			Passenger checkPassenger = passengerService.get(thePassenger.getPhoneNo());
			if(checkPassenger.getPhoneNo().equals(thePassenger.getPhoneNo()))
			{
				if(checkPassenger.getPassword().equals(thePassenger.getPassword()))
				{
					model = new ModelAndView("welcome-user-page");
					model.addObject("passenger", checkPassenger);
				}
				else
				{
					model = new ModelAndView("login-customer");
					model.addObject("user",thePassenger);
					model.addObject("error", "Invalid Password");
				}	
			}
		}catch(NoSuchElementException e)
		{
			thePassenger=null;
			model = new ModelAndView("login-customer");
			model.addObject("user",thePassenger);
			model.addObject("error", "Phone Number does not exist Register yourself..");
		}
		return model;
	}


	/*********************************************Showing User Details********************************************************/

	@RequestMapping(value="/myInfo",  method = {RequestMethod.POST, RequestMethod.GET})
	public String showFormForMyInfo1(HttpServletRequest req, Model theModel)
	{
		Passenger passenger=passengerService.get(req.getParameter("phoneNo"));
		theModel.addAttribute("passenger",passenger);
		return "my-info";	
	}
	
	/*********************************************Wallet Recharge/Gateway********************************************************/

	@RequestMapping(value="/RechargeWallet",  method = {RequestMethod.POST, RequestMethod.GET})
	public String showPaymentGatwayForm(HttpServletRequest req, Model theModel)
	{
		Passenger passenger=new Passenger();
		passenger.setPhoneNo(req.getParameter("phoneNo"));
		
		theModel.addAttribute("passenger",passenger);
		return "payment-gateway";	
	}
	
	
	/*********************************************Pay method for adding/updating wallet amount********************************************************/

	@RequestMapping(value="/pay",  method = {RequestMethod.POST, RequestMethod.GET})
	public String payMethod(HttpServletRequest req, Model theModel)
	{
		
		Passenger passenger=passengerService.get(req.getParameter("phoneNo"));
		
		

//		//ADDING MONEY TO WALET



		passenger.setWalletAmount(passenger.getWalletAmount()+Integer.parseInt(req.getParameter("walletAmount")));
		passengerService.save(passenger);
		
		theModel.addAttribute("passenger",passenger);
		return "my-info";	
	}

	/*********************************************Updating User Details********************************************************/

	@RequestMapping(value="/updateInfo",  method = {RequestMethod.POST, RequestMethod.GET})
	public String showFormForMyInfo(HttpServletRequest req, Model  theModel)
	{
		
		Passenger passenger=passengerService.get(req.getParameter("phoneNo"));
		theModel.addAttribute("passenger",passenger);
		return "update-info";
	}

	/*********************************************Saving Updated User Details********************************************************/

	@RequestMapping(value="/updateUser"  ,method = {RequestMethod.POST, RequestMethod.GET})
	public String showFormForMyInfoUpdate(@ModelAttribute ("passenger") Passenger passenger, Model theModel)
	{
		passengerService.save(passenger);
		theModel.addAttribute("passenger",passenger);
		return "welcome-user-page";	
	}

	/*********************************************For LOGO and Home Button to navigate to home page of user*******************************/

	@RequestMapping(value="/loginHome"  ,method = {RequestMethod.POST, RequestMethod.GET})
	public String showLoginHome(HttpServletRequest req, Model theModel)
	{
		Passenger passenger=passengerService.get(req.getParameter("phoneNo"));
		
		theModel.addAttribute("passenger",passenger);

		return "welcome-user-page";	
	}

	/*********************************************For About Us and Contact Us Page For Registered Passenger*******************************/

	@RequestMapping(value="/afterLoginAboutUs"  ,method = {RequestMethod.POST, RequestMethod.GET})
	public String afterLoginAboutUs(HttpServletRequest req, Model theModel)
	{
		Passenger passenger=passengerService.get(req.getParameter("phoneNo"));
		theModel.addAttribute("passenger",passenger);

		return "about-us-afterLogin";	
	}

	@RequestMapping(value="/afterLoginContactUs"  ,method = {RequestMethod.POST, RequestMethod.GET})
	public String afterLoginContactUs(HttpServletRequest req, Model theModel)
	{
		Passenger passenger=passengerService.get(req.getParameter("phoneNo"));
		theModel.addAttribute("passenger",passenger);

		return "contact-us-afterLogin";	
	}

	@RequestMapping(value = "/saveRegisteredUserContact", method= {RequestMethod.GET,RequestMethod.POST})
	public String saveRegisteredUserContactDetail(@ModelAttribute ("contact") Contact contact,Model theModel)
	{ 
		Passenger passenger=passengerService.get(contact.getPhoneNo());
		contact.setCheckReportStatus("Pending");
		contact.setCheckReport("?");
		contactService.save(contact);
		theModel.addAttribute("passenger",passenger);
		return "welcome-user-page";
	}

}
