package com.mercury.util;

import java.util.ArrayList;
import java.util.List;

import com.mercury.bean.Result;

/**
 * Enhanced Mortgage Calculator (Singleton)
 */
public class EnhancedMortgageCalculator {
	
	private static EnhancedMortgageCalculator instance;
	
	private EnhancedMortgageCalculator(){}
	
	public static EnhancedMortgageCalculator getInstance(){
		if(instance == null){
			synchronized(Adapter.class){
				if(instance == null)
					instance = new EnhancedMortgageCalculator();
			}
		}
		return instance;
	}
	
	/**
	 * Enhanced mortgage calculation method
	 * @param principal = purchase - down payment 
	 * @param loanType type of loan (fix_15, fix_20, fix_30, arm_3, arm_5, arm_7, arm_10)
	 * @param monthlyRates 4.5 / 12 / 100 
	 * @param extraPayment additional monthly payment
	 * @param extraMonth numbers of months of additional monthly payment
	 * @return List<Result>
	 */
	public List<Result> enhancedMortgageCalculate(double principal, String loanType, double[] monthlyRates, double extraPayment, int extraMonth) {
		// Fixed rate
		if (loanType.indexOf("fix") >= 0) {
			return calculateFixed(principal, loanType, monthlyRates[0], extraPayment, extraMonth);
		// Adjustable rate
		} else {
			return calculateArm(principal, loanType, monthlyRates, extraPayment, extraMonth);
		}
	}
	
	/**
	 * Mortgage calculation for fixed interest rate 
	 */
	public List<Result> calculateFixed(double principal, String loanType, double monthlyRate, double extraPayment, int extraMonth) {
		List<Result> results = new ArrayList<Result>();	
		int totalMonth = Adapter.getInstance().getTotalYear(loanType) * 12;
		double monthlyPayment = getOriginalPaymentFixed(principal, totalMonth, monthlyRate, extraPayment, extraMonth);
		
		int countMonth = 0;
		double totalPayment = 0.0;
		double balance = principal;
		for (int month = 1; month <= totalMonth; month++) {
			countMonth++;
			totalPayment += monthlyPayment;
			balance = balance * (1 + monthlyRate) - monthlyPayment;
			double extraPay = 0.0; 
			if (countMonth <= extraMonth) {
				extraPay = extraPayment;  
				totalPayment += extraPayment;
				balance = balance - extraPayment;
			}
			Result result = new Result(month, truncate(monthlyPayment), extraPay, truncate(totalPayment), truncate(balance));
			results.add(result);
		}	
		return results;
	}
	
	/**
	 * Mortgage calculation for adjustable interest rate 
	 */
	public List<Result> calculateArm(double principal, String loanType, double[] monthlyRates, double extraPayment, int extraMonth) {
		List<Result> results = new ArrayList<Result>();
		int totalMonth = Adapter.getInstance().getTotalYear(loanType) * 12;
		int fixedMonth = Adapter.getInstance().getFixedYear(loanType) * 12;
		
		int countMonth = 0;
		double payment;
		double balance = principal;
		double adjustableMonthlyRate;
		double extraPay = 0.0; 
		double totalPayment = 0.0;
		double fixedPayment = getOriginalPaymentFixed(principal, totalMonth, monthlyRates[0], extraPayment, extraMonth);
		for (int month = 1; month <= totalMonth; month++) {
			adjustableMonthlyRate = monthlyRates[countMonth++];
			if (countMonth <= extraMonth) {
				extraPay = extraPayment; 
			} else {
				extraPay = 0.0; 
			}
			if (month < fixedMonth) {
				payment = fixedPayment;
			} else {
				payment = getCurrentMonthlyPayment(balance, adjustableMonthlyRate, totalMonth - countMonth + 1);
			}
			totalPayment = totalPayment + payment + extraPay;
			balance = balance * (1 + adjustableMonthlyRate) - payment - extraPay;
			Result result = new Result(month, truncate(payment), extraPay, truncate(totalPayment), truncate(balance));
			results.add(result);
		}
		return results;
	}
	
	/**
	 *  Get original total payment
	 */
	public double getOriginalTotalPayment(double principal, String loanType, double[] monthlyRates) {
		List<Result> results;
		// Fixed rate
		if (loanType.indexOf("fix") >= 0) {
			results = calculateFixed(principal, loanType, monthlyRates[0], 0, 0);
		// Adjustable rate
		} else {
			results = calculateArm(principal, loanType, monthlyRates, 0, 0);
		}
		return results.get(results.size() - 1).getTotalPayment();  
	}
	
	public double getCurrentTotalPayment(List<Result> results) {
		return results.get(results.size() - 1).getTotalPayment();
	}
	
	public double getOriginalPaymentFixed(double principal, int totalMonth, double monthRate, double extraPayment, int extraMonth) {
		double temp1 = Math.pow((1 + monthRate), totalMonth);
		double temp2 = Math.pow((1 + monthRate), (totalMonth - extraMonth));
		double payment = principal * monthRate * temp1 / (temp1 - 1) - extraPayment * (temp1 - temp2) / (temp1 - 1);
		return payment;
	}
	
	/**
	 * Get current monthly payment (for one month)
	 */
	public double getCurrentMonthlyPayment(double balance, double currentInterest, double remainMonth) {
		double temp = Math.pow((1 + currentInterest), -remainMonth);
		return balance * currentInterest / (1 - temp);
	}
	
	/**
	 * Truncate number to 2 decimal places, eg. 6.6666 -> 6.66
	 */
	public double truncate(double num) {
		return (int) (100 * num) / 100;
	}
}
