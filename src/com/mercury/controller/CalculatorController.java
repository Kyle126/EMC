package com.mercury.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.mercury.bean.Loan;
import com.mercury.bean.Schedule;
import com.mercury.service.CalculatorService;

@Controller
@SessionAttributes
public class CalculatorController {
	@Autowired
	@Qualifier("calculatorService")
	private CalculatorService cs;
	
	@RequestMapping(value = "/calculator", method = RequestMethod.GET)
	public String calculatorPage() {
		return "calculator/calculator";
	}
	
	// RESTful web service
	@RequestMapping(value = "/calculate", method = RequestMethod.POST)	
	@ResponseBody
	public Schedule getPaymentSchedule(@RequestBody Loan loan) {
		double purchase = loan.getPurchase();
		double downPayment = loan.getDownPayment();  // 6.6%
		String state = loan.getState();
		String loanType = loan.getLoanType();
		double extraPayment = loan.getExtraPayment();
		int extraMonth = loan.getExtraMonth();
		return cs.getPaymentSchedule(purchase, downPayment, state, loanType, extraPayment, extraMonth);
	}
}
