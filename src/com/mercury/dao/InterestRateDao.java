package com.mercury.dao;

import java.util.List;

import com.mercury.bean.InterestRate;

public interface InterestRateDao {
	public InterestRate findByState(String state);
	public double findInterestRate(String state, String loanType);
	public List<InterestRate> queryAll();
	public void updateInterestRate(String state, String loanType, double newInterestRate);
}
