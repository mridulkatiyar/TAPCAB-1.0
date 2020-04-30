package com.niit.cab.controller;

import java.util.Collections;
import java.util.List;
import java.util.NoSuchElementException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.niit.cab.model.Address;
import com.niit.cab.model.Cab;
import com.niit.cab.model.CabBooking;
import com.niit.cab.model.Passenger;
import com.niit.cab.service.CabBookingService;
import com.niit.cab.service.CabService;
import com.niit.cab.service.PassengerService;

@Controller
public class BookingController {
	@Autowired
	CabBookingService cabService;

	@Autowired
	CabService cabDetailsService;

	@Autowired
	PassengerService passengerService;


	/*********************************************Method for showing the cab booking form only (phoneno read only)*********************************************/

	@RequestMapping("/viewBookingForm")
	public String viewBookingForm(HttpServletRequest req,Model model) {
		String thePhoneNo=req.getParameter("phoneNo");
		Passenger passenger=passengerService.get(thePhoneNo);
		model.addAttribute("passenger",passenger);

		CabBooking cb=new CabBooking();
		model.addAttribute("cabBooking",cb);

		return "cab-booking-form";

	}

	/*********************************************Method for Booking cab onclick on book cab button(& save in databasse)*********************************************/


	@PostMapping("/bookCab")
	public String bookCab(HttpServletRequest req,@ModelAttribute("cabBooking") CabBooking cabBooking,Model model)
	{
		Passenger passenger=passengerService.get(cabBooking.getPhoneNo());

		String pickUpAddress =req.getParameter("pickUpAddress");
		String pickUpCity=req.getParameter("pickUpCity");
		String pickUpState=req.getParameter("pickUpState");
		int pickUpPinCode=Integer.parseInt(req.getParameter("pickUpPinCode"));
		String destiAddress=req.getParameter("destiAddress");
		String destiCity=req.getParameter("destiCity");
		String destiState=req.getParameter("destiState");
		int destiPinCode=Integer.parseInt(req.getParameter("destiPinCode"));

		Address a=new Address();
		a.setPickUpAddress(pickUpAddress);
		a.setPickUpCity(pickUpCity);
		a.setPickUpPinCode(pickUpPinCode);
		a.setPickUpState(pickUpState);

		a.setDestiAddress(destiAddress);
		a.setDestiCity(destiCity);
		a.setDestiPinCode(destiPinCode);
		a.setDestiState(destiState);

		a.setCabBooking(cabBooking);

		cabBooking.setAddress(a);
		cabBooking.setFare(0);
		cabBooking.setStatus("pending");


		cabService.saveBooking(cabBooking);
		List<CabBooking> theCabBooking = cabService.getMyTrips(req.getParameter("phoneNo"));
		Collections.reverse(theCabBooking);


		model.addAttribute("cabBooking", theCabBooking);
		model.addAttribute("passenger",passenger);


		return "my-trips";
	}
	/*********************************************Method for show My trips History*********************************************/


	@RequestMapping(value="/myTrips",method = {RequestMethod.POST, RequestMethod.GET}) // @GetMapping - method level , default GET method
	public String listMyTrips(Model theModel,HttpServletRequest req) {

		String thePhoneNo=req.getParameter("phoneNo");

		List<CabBooking> theCabBooking = cabService.getMyTrips(thePhoneNo);
		Collections.reverse(theCabBooking);
		Passenger passenger=passengerService.get(thePhoneNo);
		theModel.addAttribute("cabBooking", theCabBooking);
		theModel.addAttribute("passenger", passenger);
		return "my-trips";

	}

	/*********************************************Method for going to all details & see cab detais to book*********************************************/


	@RequestMapping(value="/allDetail",method = {RequestMethod.POST, RequestMethod.GET})// @GetMapping - method level , default GET method
	public String allDetail(HttpServletRequest req,Model model)
	{


		Long bookingId1=Long.parseLong(req.getParameter("bookingId"));
		CabBooking cabBooking=cabService.get(bookingId1);
		model.addAttribute("cabBooking", cabBooking);	

		Passenger thePassenger=passengerService.get(cabBooking.getPhoneNo());
		model.addAttribute("passenger",thePassenger);

		if(cabBooking.getStatus().equals("pending")  || cabBooking.getStatus().equals("Rejected") )
		{

			if(cabBooking.getStatus().equals("pending"))
			{
				model.addAttribute("error", "Your Request Is Pending We will let you know the status shortly ");			
			}

			else {

				model.addAttribute("error", "SORRY, Your Request has been Rejected Please Book Your CAB Again ");
			}
			return "pending-cab-detail";
		}

		else {
			try {
				model.addAttribute("cabBooking", cabBooking);
				Cab theCab=cabDetailsService.get(cabBooking.getCabId());
				model.addAttribute("cab", theCab);


				if(cabBooking.getStatus().equals("Initiated")) {


					return "user-final-cab-details";
				}
				else if(cabBooking.getStatus().equals("Ride Cancelled"))

				{
					model.addAttribute("error", "You Cancelled Your Booked Cab");
					return "pending-cab-detail";

				}	
				else {

					model.addAttribute("error", "Your Request Is Confirmed ");
					return "pending-cab-detail";
				}
			}
			catch(NoSuchElementException e)
			{
			
				model.addAttribute("error", "The cab you assigned is no more present ");
				return "pending-cab-detail";
			}
		}
	}

	/*********************************************Method if ride accepted by user & wallet amount deducted*********************************************/

	@RequestMapping(value="/acceptRide",method = {RequestMethod.POST, RequestMethod.GET})// @GetMapping - method level , default GET method
	public String acceptRide(Model model,HttpServletRequest req)
	{
		Passenger thePassenger=passengerService.get(req.getParameter("phoneNo"));
		model.addAttribute("passenger",thePassenger);

		String paymentMode=req.getParameter("paymentMode");

		CabBooking cabBooking=cabService.get(Long.parseLong(req.getParameter("bookingId")));


		if(paymentMode.equals("TAP-CAB WALLET"))
		{
			int amount=thePassenger.getWalletAmount();
			amount=amount-cabBooking.getFare();
			thePassenger.setWalletAmount(amount);			
		}		


		cabBooking.setPaymentMode(paymentMode);
		cabBooking.setStatus("Ride Accepted");


		List<CabBooking> theCabBooking = cabService.getMyTrips(req.getParameter("phoneNo"));
		Collections.reverse(theCabBooking);

		model.addAttribute("cabBooking", theCabBooking);
		passengerService.save(thePassenger);
		cabService.saveBooking(cabBooking);

		return "my-trips";
	}


	/*********************************************Method for cancel the cab by user & chnge status in db to ride cncelled********************************************/

	@RequestMapping(value="/cancelRide",method = {RequestMethod.POST, RequestMethod.GET})// @GetMapping - method level , default GET method
	public String cancelRide(Model model,HttpServletRequest req)
	{
		Long bookingId1=Long.parseLong(req.getParameter("bookingId"));
		CabBooking cabBooking=cabService.get(bookingId1);

		Passenger thePassenger=passengerService.get(cabBooking.getPhoneNo());
		model.addAttribute("passenger",thePassenger);


		cabBooking.setStatus("Ride Cancelled");
		cabService.saveBooking(cabBooking);
		return "welcome-user-page";
	}
	/*********************************************For feedback from Registered Passenger*******************************/
	@RequestMapping(value="/saveFeedback",method = {RequestMethod.POST, RequestMethod.GET})// @GetMapping - method level , default GET method
	public String saveFeedback(Model model,HttpServletRequest req)
	{


		CabBooking cabBooking=cabService.get(Long.parseLong(req.getParameter("bookingId")));
		Passenger thePassenger=passengerService.get(cabBooking.getPhoneNo());
		model.addAttribute("passenger",thePassenger);

		cabBooking.setFeedback(req.getParameter("feedback"));
		cabBooking.setFeedbackFlag(true);
		cabService.saveBooking(cabBooking);

		List<CabBooking> theCabBooking = cabService.getMyTrips(cabBooking.getPhoneNo());
		Collections.reverse(theCabBooking);
		model.addAttribute("cabBooking", theCabBooking);
		return "my-trips";


	}
}
