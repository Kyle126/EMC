package com.mercury.service;

import java.util.List;

import org.springframework.cache.annotation.Cacheable;

import com.mercury.bean.Result;
import com.mercury.bean.Schedule;
import com.mercury.dao.AutoloanInterestRateDao;
import com.mercury.dao.InterestRateDao;
import com.mercury.util.Adapter;
import com.mercury.util.EnhancedMortgageCalculator;

public class CalculatorService {
	private InterestRateDao rd;
	private AutoloanInterestRateDao ard;

	public InterestRateDao getRd() {
		return rd;
	}
	public void setRd(InterestRateDao rd) {
		this.rd = rd;
	}
	public AutoloanInterestRateDao getArd() {
		return ard;
	}
	public void setArd(AutoloanInterestRateDao ard) {
		this.ard = ard;
	}
	
	@Cacheable("getPaymentSchedule") 
	/*
	 * The parameters this method used before -> spring cache does not work.
	 */
//	public Schedule getPaymentSchedule(Loan loan) {
	/*
	 * The parameters this method uses now -> spring cache works!!
	 */
	public Schedule getPaymentSchedule(double purchase, double downPayment, 
			String state, String loanType,double extraPayment,int extraMonth) {
		// For cacheable testing
		System.out.println("Execute mortgage calculation. --> cache it.");  // For spring cache testing (cache)

		double principal = purchase * (1 - downPayment / 100);
		double[] monthlyRates = getMonthlyRates(state, loanType);
		List<Result> results = EnhancedMortgageCalculator.getInstance()
				.enhancedMortgageCalculate(principal, loanType, monthlyRates, extraPayment, extraMonth);
		double savedInterest = 0.0;
		if (extraPayment != 0 && extraMonth != 0) {
			savedInterest = EnhancedMortgageCalculator.getInstance()
					.getOriginalTotalPayment(principal, loanType, monthlyRates) 
					- EnhancedMortgageCalculator.getInstance().getCurrentTotalPayment(results);
			savedInterest = EnhancedMortgageCalculator.getInstance().truncate(savedInterest);
		}
		double totalInterest = results.get(results.size() - 1).getTotalPayment() - purchase;
		return new Schedule(results, purchase, downPayment, results.size() / 12, monthlyRates, savedInterest, 
				loanType, extraPayment, extraMonth, totalInterest);
	}

	/*
	 * Get monthly rate 4.5 / 12 / 100
	 */
	public double[] getMonthlyRates(String state, String loanType) {
		double monthlyRate = rd.findInterestRate(state, loanType) / 12 / 100;
		int totalMonth = Adapter.getInstance().getTotalYear(loanType) * 12;
		int fixedMonth = Adapter.getInstance().getFixedYear(loanType) * 12;
		double[] monthlyRates = new double[totalMonth];
		for (int i = 0; i < totalMonth; i++) {
			if (i < fixedMonth) {
				monthlyRates[i] = monthlyRate;
			} else {
				monthlyRate = monthlyRate + 1E-4 * Math.random() - 3E-5;
				monthlyRates[i] = monthlyRate;
			}
		}
		return monthlyRates;
	}
}
