package com.mercury.service;

import java.util.List;

import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;

import com.mercury.bean.AutoloanInterestRate;
import com.mercury.bean.InterestRate;
import com.mercury.dao.AutoloanInterestRateDao;
import com.mercury.dao.InterestRateDao;

public class AdminService {
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


	/*
	 * loanType: 15_fix, 20_fix, 30_fix, 30_arm_3, 30_arm_5, 30_arm_7, 30_arm_10
	 */
	public double getInterestRate(String state, String loanType) {
		InterestRate rate = rd.findByState(state);
		if (rate != null) {
			// Using if else since switch not support String type in Java 6
			if (loanType.equals("15_fix"))
				return rate.getFix_15();
			else if (loanType.equals("20_fix"))
				return rate.getFix_20();
			else if (loanType.equals("30_fix"))
				return rate.getFix_30();
			else if (loanType.equals("30_arm_3"))
				return rate.getArm_3();
			else if (loanType.equals("30_arm_5"))
				return rate.getArm_5();
			else if (loanType.equals("30_arm_7"))
				return rate.getArm_7();
			else if (loanType.equals("30_arm_10"))
				return rate.getArm_10();
		}
		return -1;  // error;
	}
	
	public double getAutoloanInterestRate(String state, String loanType) {
		AutoloanInterestRate rate = ard.findByState(state);
		if (rate != null) {
			// Using if else since switch not support String type in Java 6
			if (loanType.equals("3_fix"))
				return rate.getFix_3();
			else if (loanType.equals("4_fix"))
				return rate.getFix_4();
			else if (loanType.equals("5_fix"))
				return rate.getFix_5();
			else if (loanType.equals("6_fix"))
				return rate.getFix_6();
		}
		return -1;  // error;
	}
	
	/*
	 * Update specific interest rate
	 */
	@CacheEvict(value = {"getAllInterestRates", "getPaymentSchedule"}, allEntries = true)
	public void updateInterestRate(String state, String loanType, double newInterestRate) {
		System.out.println("Update a specific interest rate value. --> evict caches.");  // For spring cache testing (evict)
		rd.updateInterestRate(state, loanType, newInterestRate);
	}

	/*
	 * Get all interest rates of all states
	 */
	@Cacheable("getAllInterestRates")
	public List<InterestRate> getTypes(){
		System.out.println("Query all interest rates. --> cache it.");  // For spring cache testing (cache)
		return rd.queryAll();
	}
	
}
