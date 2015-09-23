package com.mercury.bean;

import java.util.List;

/**
 * Schedule of mortgage calculation 
 */
public class Schedule {
	private List<Result> results;
	private double purchase;  
	private double downPayment;  // 6.6%
	private int termInYears;
	private double[] monthlyRates;  // monthlyRates[0] * 12 * 100 is saved database
	private double savedInterest;
	private String loanType;
	private double extraPayment;
	private int extraMonth;
	private double totalInterest;
	
	public Schedule() {}
	
	public Schedule(List<Result> results, double purchase, double downPayment,
			int termInYears, double[] monthlyRates, double savedInterest,
			String loanType, double extraPayment, int extraMonth, double totalInterest) {
		this.results = results;
		this.purchase = purchase;
		this.downPayment = downPayment;
		this.termInYears = termInYears;
		this.monthlyRates = monthlyRates;
		this.savedInterest = savedInterest;
		this.loanType = loanType;
		this.extraPayment = extraPayment;
		this.extraMonth = extraMonth;
		this.totalInterest = totalInterest;
	}

	public List<Result> getResults() {
		return results;
	}
	public void setResults(List<Result> results) {
		this.results = results;
	}
	public double getPurchase() {
		return purchase;
	}
	public void setPurchase(double purchase) {
		this.purchase = purchase;
	}
	public double getDownPayment() {
		return downPayment;
	}
	public void setDownPayment(double downPayment) {
		this.downPayment = downPayment;
	}
	public int getTermInYears() {
		return termInYears;
	}
	public void setTermInYears(int termInYears) {
		this.termInYears = termInYears;
	}
	public double[] getMonthlyRates() {
		return monthlyRates;
	}
	public void setMonthlyRates(double[] monthlyRates) {
		this.monthlyRates = monthlyRates;
	}
	public double getSavedInterest() {
		return savedInterest;
	}
	public void setSavedInterest(double savedInterest) {
		this.savedInterest = savedInterest;
	}
	public String getLoanType() {
		return loanType;
	}
	public void setLoanType(String loanType) {
		this.loanType = loanType;
	}
	public double getExtraPayment() {
		return extraPayment;
	}
	public void setExtraPayment(double extraPayment) {
		this.extraPayment = extraPayment;
	}
	public int getExtraMonth() {
		return extraMonth;
	}
	public void setExtraMonth(int extraMonth) {
		this.extraMonth = extraMonth;
	}
	public double getTotalInterest() {
		return totalInterest;
	}
	public void setTotalInterest(double totalInterest) {
		this.totalInterest = totalInterest;
	}
}
