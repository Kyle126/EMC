package com.mercury.bean;

/**
 * @param purchase total amount of loan
 * @param state state of loan
 * @param downPayment down payment of loan, 5.6% = 5.6
 * @param loanType type of loan (fix_15, fix_20, fix_30, arm_3, arm_5, arm_7, arm_10)
 */
public class Loan {
	private double purchase; 
	private double downPayment;
//	private int termInYears;
	private String state;
	private String loanType;
	private double extraPayment;  // enhanced field
	private int extraMonth;  // enhanced field
	 
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
//	public int getTermInYears() {
//		return termInYears;
//	}
//	public void setTermInYears(int termInYears) {
//		this.termInYears = termInYears;
//	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
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
}
