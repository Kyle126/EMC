package com.mercury.dao;

import java.util.List;

import com.mercury.bean.AutoloanInterestRate;

public interface AutoloanInterestRateDao {
	public AutoloanInterestRate findByState(String state);
	public double findAutoloanInterestRate(String state, String loanType);
	public List<AutoloanInterestRate> queryAll();
	public void updateAutoloanInterestRate(String state, String loanType, double newAutoloanInterestRate);
}
