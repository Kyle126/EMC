package com.mercury.dao;

import java.util.List;

import com.mercury.bean.PersonalInterestRate;

public interface PersonalInterestRateDao {
	public PersonalInterestRate findByBankName(String bank_name);
	public double findPersonalInterestRate(String bank_name);
	public List<PersonalInterestRate> queryAll();
	public void updatePersonalInterestRate(String bank_name, double newPersonalInterestRate);
}
