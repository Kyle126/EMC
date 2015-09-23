package com.mercury.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.mercury.bean.InterestRate;
import com.mercury.bean.Loan;
import com.mercury.service.AdminService;
import com.mercury.util.Adapter;

@Controller
@SessionAttributes
public class AdminController {
	@Autowired
	@Qualifier("adminService")
	private AdminService as;
	
	// RESTful web service for get current interest rate
	@RequestMapping(value="/getOldInterestRate", method=RequestMethod.POST)	
	@ResponseBody
	public double getCurrentInterestRate(@RequestBody Loan loan) {
		double currInterestRate = as.getInterestRate(loan.getState(), loan.getLoanType());
		return currInterestRate;
	}
	
	@RequestMapping(value = "/updateInterestRate", method = RequestMethod.GET)
	public String updateInterestRatePage() {
		return "admin/updateInterestRate";
	}
	
	// Update specific interest rate
	@RequestMapping(value = "/updateInterestRate", method = RequestMethod.POST)
	public ModelAndView updateInterestRate( 
			@RequestParam("state") String state,
			@RequestParam("loanType") String loanType, 
			@RequestParam("newInterestRate") double newInterestRate) {
		as.updateInterestRate(Adapter.getInstance().abbrebiate(state), loanType, newInterestRate);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/updateInterestRate");
		mav.addObject("success", "Update interest rate successfully.");
		return mav;
	}
	
	@RequestMapping(value = "/showInterestRate", method = RequestMethod.GET)
	public String showInterestRateTablePage() {
		return "admin/showInterestRate";
	}
	
	// RESTful web service for get all interest rates
	@RequestMapping(value = "/allRatesTypes", method = RequestMethod.GET)
	@ResponseBody
	public List<InterestRate> getAllRatesTypes() {
	    List<InterestRate> interestRateTypes = as.getTypes();
	    return interestRateTypes;
	}
}


