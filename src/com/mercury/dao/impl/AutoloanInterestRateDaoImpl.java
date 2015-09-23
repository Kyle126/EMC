package com.mercury.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.mercury.bean.AutoloanInterestRate;
import com.mercury.dao.AutoloanInterestRateDao;

public class AutoloanInterestRateDaoImpl implements AutoloanInterestRateDao {
	private HibernateTemplate template;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		template = new HibernateTemplate(sessionFactory);
	}
	@SuppressWarnings("unchecked")
	@Override
	public AutoloanInterestRate findByState(String state) {
		String hql = "from AutoloanInterestRate where state = ?";
		List<AutoloanInterestRate> rates = template.find(hql, state);
		if(rates.size()>0) {
			return rates.get(0);
		} else {
			return null;	//not found
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public double findAutoloanInterestRate(String state, String loanType) {
		String hql = "select i." + loanType + " from AutoloanInterestRate as i where i.state = '" + state + "'";
		List<Double> rates = template.find(hql);
		if (rates.size() > 0) {
			return Double.valueOf(rates.get(0));
		} else {
			return -1;  // not found
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<AutoloanInterestRate> queryAll() {
		String hql = "from AutoLoanInterestRate";
		return template.find(hql);
	}
	
	public void updateAutoloanInterestRate(String state, String loanType, double newAutoloanInterestRate) {
		AutoloanInterestRate row = findByState(state);
		// Using if else since switch not support String type in Java 6
		if (loanType.equals("3_fix"))
			row.setFix_3(newAutoloanInterestRate);
		else if (loanType.equals("4_fix"))
			row.setFix_4(newAutoloanInterestRate);
		else if (loanType.equals("5_fix"))
			row.setFix_5(newAutoloanInterestRate);
		else if (loanType.equals("6_fix"))
			row.setFix_6(newAutoloanInterestRate);
		template.update(row);
	}
}
