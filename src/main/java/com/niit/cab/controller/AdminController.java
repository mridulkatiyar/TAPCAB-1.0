package com.niit.cab.controller;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.cab.model.Admin;
import com.niit.cab.model.Cab;
import com.niit.cab.model.CabBooking;
import com.niit.cab.model.Contact;
import com.niit.cab.model.Passenger;
import com.niit.cab.service.CabBookingService;
import com.niit.cab.service.CabService;
import com.niit.cab.service.ContactService;
import com.niit.cab.service.PassengerService;

@Controller
public class AdminController {
	
	@Autowired
	PassengerService passengerService;
	
	@Autowired
	ContactService contactService;
	
	@Autowired
	CabBookingService cabBookingService;
	
	@Autowired
	CabService cabService;

	/*********************************************Showing An Admin Login Form*********************************************/
	
	@RequestMapping(value = "/loginAdminForm", method = { RequestMethod.POST, RequestMethod.GET })
	public String viewLoginForm() {
		return "login-admin";
	}
	

	/*********************************************Validating Admin Credentials *********************************************/
	
	@RequestMapping(value = "/loginAdmin",  method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView processLogin(@ModelAttribute  Admin theAdmin) {

		ModelAndView model = null;

		if("Admin123".equals(theAdmin.getAdminId()))
		{
			if( "Admin123".equals(theAdmin.getPassword()))
			{
				model = new ModelAndView("welcome-admin-page");
			}
			else
			{
				model = new ModelAndView("login-admin");
				model.addObject("error", "Invalid Password");
			}	
		}

		else
		{
			model = new ModelAndView("login-admin");
			model.addObject("error", "Invalid Admin Id");
		}
		return model;
	}
	
	/*********************************************Showing An Admin home Page*********************************************/

	@RequestMapping(value = "/adminHome", method = { RequestMethod.POST, RequestMethod.GET })
	public String viewAdminHome() {
		return "welcome-admin-page";
	}


	/*********************************************Showing Registered Users List*********************************************/
	

	@RequestMapping(value="/passengerList",method = {RequestMethod.POST, RequestMethod.GET}) // @GetMapping - method level , default GET method
	public String listPassenger(ModelMap theModel) {
		List<Passenger> thePassenger = passengerService.listAll();
		theModel.addAttribute("passengers", thePassenger);
		return "list-passenger";
	}

	/*********************************************Method for delete an registered user*********************************************/
	
	@RequestMapping(value="/passenger/delete",method = {RequestMethod.POST, RequestMethod.GET})
	public String deleteCustomer(HttpServletRequest req)
	{
		String phoneNo=req.getParameter("phoneNo");
		passengerService.delete(phoneNo);
		return "redirect:/passengerList";
	}

	/*********************************************Method for reply to user for contact us form *********************************************/
	
	@RequestMapping(value="/listContactUsForms",method = {RequestMethod.POST, RequestMethod.GET})
	public String listContactUsRequest(ModelMap theModel)
	{
		List<Contact> theContact=contactService.listAll();
		theModel.addAttribute("contacts", theContact);
		return "listContactForm";
	}

	@RequestMapping(value="/conatct/reply",method= {RequestMethod.POST,RequestMethod.GET})
	public String replyContactForm()
	{
		
		return "redirect:/listContactUsForms";
	}
	
	/*********************************************Method for Show Booking Request*********************************************/
	
	@RequestMapping(value="/showBookingRequest",method = {RequestMethod.POST, RequestMethod.GET})
	public String listBookingRequest(ModelMap theModel)
	{
		
		List<CabBooking> theCabBooking=cabBookingService.listAll();
		Collections.reverse(theCabBooking);
		theModel.addAttribute("cabBooking", theCabBooking);
		return "show-booking-request";
	}
	
	@RequestMapping(value="/setBookingStatus",method = {RequestMethod.POST, RequestMethod.GET})
	public String setBookingStatus(HttpServletRequest req,ModelMap theModel)
	{ 	
		
		Long bookingId=Long.parseLong(req.getParameter("bookingId"));
		CabBooking cabBooking=cabBookingService.get(bookingId);
		
		
		if(cabBooking.getStatus().equals("pending"))
		{
			theModel.addAttribute("cabBooking", cabBooking);
			theModel.addAttribute("address", cabBooking.getAddress());
			return "set-booking-status-fare";
		}
		else
		{

			List<CabBooking> theCabBooking=cabBookingService.listAll();
			Collections.reverse(theCabBooking);
			theModel.addAttribute("cabBooking", theCabBooking);
			theModel.addAttribute("error","Ride Already Initiated/Accepted");
			return"show-booking-request";
		}         
		
	}
	
	/*********************************************Method for Giving the cab fare & save*********************************************/
	@RequestMapping(value="/saveBookingFare",method = {RequestMethod.POST, RequestMethod.GET})
	public String saveBookingFare(HttpServletRequest req,Model model)
	{

		
		CabBooking theCabBooking=cabBookingService.get(Long.parseLong(req.getParameter("bookingId")));
		
		
		int fare=Integer.parseInt(req.getParameter("fare"));
		theCabBooking.setFare(fare);
		
		cabBookingService.saveBooking(theCabBooking);
		model.addAttribute("theCabBooking", theCabBooking);
		
		List<Cab> theCab=cabService.listAll();
		
		model.addAttribute("cab", theCab);
		return "cab-list";
	
	}
	

	
	/*********************************************After fare this  Method for assigning the cab to booking*********************************************/


	@RequestMapping(value="/assignCab",method = {RequestMethod.POST, RequestMethod.GET})
	public String assignCab(@RequestParam("cabId") long cabId,@RequestParam("bookingId") String bookingId,Model model)
	{

		CabBooking theCabBooking=cabBookingService.get(Long.parseLong(bookingId));
		theCabBooking.setCabId(cabId);
		
		theCabBooking.setStatus("Initiated");
		cabBookingService.saveBooking(theCabBooking);

		return "redirect:/showBookingRequest";
	
	}
	
	
	
	
	
	/*********************************************Method for Rejecting the cab(becz of any reason)*********************************************/

	@RequestMapping(value="/rejectBookingRequest",method = {RequestMethod.POST, RequestMethod.GET})// @GetMapping - method level , default GET method
	public String rejectBookingRequest(Model model,HttpServletRequest req)
	{
		Long bookingId1=Long.parseLong(req.getParameter("bookingId"));
		CabBooking cabBooking=cabBookingService.get(bookingId1);
		
		cabBooking.setStatus("Rejected");
		cabBookingService.saveBooking(cabBooking);
		
		return "redirect:/showBookingRequest";
	}
	
	/*********************************************Method for show cab from And Save cab in database ********************************************/
	
	

	@RequestMapping(value = "/showCabDetailsForm", method= {RequestMethod.GET,RequestMethod.POST})
	public String showCabDetailsForm()
	{ 
		
	
		return "admin-set-cab";
	}
	
	
	@RequestMapping(value = "/saveCabDetails", method= {RequestMethod.GET,RequestMethod.POST})
	public String saveCabDetails(@ModelAttribute ("cab") Cab cab,Model model)
	{ 
	
		
		cabService.save(cab);
		
		return "redirect:/viewCabDetails";
	}
	
	/*********************************************Method for VIEW CAB DETAILS ********************************************/
	@RequestMapping(value = "/viewCabDetails", method= {RequestMethod.GET,RequestMethod.POST})
	public String viewCabDetails(Model model)
	{ 
		List<Cab> theCab=cabService.listAll();
		
		model.addAttribute("cab", theCab);
		return "show-cab-list-for-update-delete";
	}
	
	
	
	
	/*********************************************Method for UPDATE/DELETE CAB DETAILS ********************************************/
	
	@RequestMapping(value = "/updateCab", method= {RequestMethod.GET,RequestMethod.POST})
	public String updateCab(HttpServletRequest req, ModelMap model)
	{ 
		
		Cab cab=cabService.get(Long.parseLong(req.getParameter("cabId")));

		model.addAttribute("cab", cab);
	
		return "admin-set-cab";
	}
	
	
	@RequestMapping(value = "/deleteCab", method= {RequestMethod.GET,RequestMethod.POST})
	public String deleteCab(HttpServletRequest req, ModelMap model)
	{ 
		
		//Cab cab=cabService.get(Long.parseLong(req.getParameter("cabId")));
		cabService.delete(Long.parseLong(req.getParameter("cabId")));
		return "redirect:/viewCabDetails";
	}
	
	
}
