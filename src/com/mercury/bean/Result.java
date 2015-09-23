package com.mercury.bean;

/**
 * Result of mortgage calculation 
 */
public class Result {
	private int month;
	private double monthlyPayment;
	private double extraPayment;
	private double totalPayment; 
	private double remainingPrincipal;
	
	public Result() {};
	public Result(int month, double monthlyPayment, double extraPayment,
			double totalPayment, double remainingPrincipal) {
		this.month = month;
		this.monthlyPayment = monthlyPayment;
		this.extraPayment = extraPayment;
		this.totalPayment = totalPayment;
		this.remainingPrincipal = remainingPrincipal;
	}
	
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public double getMonthlyPayment() {
		return monthlyPayment;
	}
	public void setMonthlyPayment(double monthlyPayment) {
		this.monthlyPayment = monthlyPayment;
	}
	public double getExtraPayment() {
		return extraPayment;
	}
	public void setExtraPayment(double extraPayment) {
		this.extraPayment = extraPayment;
	}
	public double getTotalPayment() {
		return totalPayment;
	}
	public void setTotalPayment(double totalPayment) {
		this.totalPayment = totalPayment;
	}
	public double getRemainingPrincipal() {
		return remainingPrincipal;
	}
	public void setRemainingPrincipal(double remainingPrincipal) {
		this.remainingPrincipal = remainingPrincipal;
	}
	
	@Override
	public String toString() {
		return "month: " + month + ", monthlyPayment: " + monthlyPayment 
				+ ", extraPayment: " + extraPayment + ", totalPayment: " 
				+ totalPayment + ", remainingPrincipal: " + remainingPrincipal;
	}
}
