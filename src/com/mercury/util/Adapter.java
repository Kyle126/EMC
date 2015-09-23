package com.mercury.util;

import java.util.HashMap;
import java.util.Map;

public class Adapter {
	private static Adapter instance;
	private Map<String, String> stateMap;
	private Map<String, Integer> totalYearMap;
	private Map<String, Integer> fixedYearMap;
	private Map<String, Integer> loanTypeMap;
	
	private Adapter(){
		// Initialize stateMap
		String[] states = {"AL" , "Alabama", "AK" , "Alaska", "AZ" , "Arizona", "AR" , "Arkansas",	"CA" , "California",
				"CO" , "Colorado", "CT" , "Connecticut", "DE" , "Delaware",	"DC" , "District Of Columbia",
				"FL" , "Florida", "GA" , "Georgia",	"HI" , "Hawaii", "ID" , "Idaho", "IL" , "Illinois",
				"IN" , "Indiana", "IA" , "Iowa", "KS" , "Kansas", "KY" , "Kentucky", "LA" , "Louisiana",
				"ME" , "Maine",	"MD" , "Maryland", "MA" , "Massachusetts", "MI" , "Michigan", "MN" , "Minnesota",
				"MS" , "Mississippi", "MO" , "Missouri", "MT" , "Montana",	"NE" , "Nebraska", "NV" , "Nevada",
				"NH" , "New Hampshire",	"NJ" , "New Jersey", "NM" , "New Mexico", "NY" , "New York",
				"NC" , "North Carolina", "ND" , "North Dakota",	"OH" , "Ohio",	"OK" , "Oklahoma", "OR" , "Oregon",
				"PA" , "Pennsylvania", "RI" , "Rhode Island", "SC" , "South Carolina",	"SD" , "South Dakota",
				"TN" , "Tennessee",	"TX" , "Texas",	"UT" , "Utah", "VT" , "Vermont", "VA" , "Virginia",
				"WA" , "Washington", "WV" , "West Virginia", "WI" , "Wisconsin", "WY" , "Wyoming"};
		stateMap = new HashMap<String, String>();
		for (int i = 0; i < states.length; i += 2) {
			stateMap.put(states[i + 1], states[i]);
		}
		// Initialize totalYearMap
		totalYearMap = new HashMap<String, Integer>();
		totalYearMap.put("fix_15", 15); totalYearMap.put("fix_20", 20); totalYearMap.put("fix_30", 30); totalYearMap.put("arm_3", 30);
		totalYearMap.put("arm_5", 30); totalYearMap.put("arm_7", 30); totalYearMap.put("arm_10", 30);
		// Initialize totalYearMap
		fixedYearMap = new HashMap<String, Integer>();
		fixedYearMap.put("fix_15", 15); fixedYearMap.put("fix_20", 20); fixedYearMap.put("fix_30", 30); fixedYearMap.put("arm_3", 3);
		fixedYearMap.put("arm_5", 5); fixedYearMap.put("arm_7", 7); fixedYearMap.put("arm_10", 10);
		// Initialize loanTypeMap
		loanTypeMap = new HashMap<String, Integer>();
		loanTypeMap.put("fix_15", 15); loanTypeMap.put("fix_20", 20); loanTypeMap.put("fix_30", 30); loanTypeMap.put("arm_3", 3);
		loanTypeMap.put("arm_5", 5); loanTypeMap.put("arm_7", 7); loanTypeMap.put("arm_10", 10);
	}
	
	public static Adapter getInstance(){
		if(instance == null){
			synchronized(Adapter.class){
				if(instance == null)
					instance = new Adapter();
			}
		}
		return instance;
	}
	
	public String abbrebiate(String state) {
		return stateMap.get(state);
	}
	
	public int getTotalYear(String loanType) {
		return totalYearMap.get(loanType);
	}
	
	public int getFixedYear(String loanType) {
		return fixedYearMap.get(loanType);
	}
	
}
