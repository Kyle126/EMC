package com.mercury.bean;

/**
 * Interest rate in year
 */
public class InterestRate {
	private int state_id;
	private String state;
	private double fix_30;
	private double fix_20;
	private double fix_15;
	private double arm_3;
	private double arm_5;
	private double arm_7;
	private double arm_10;
	
	public int getState_id() {
		return state_id;
	}
	public void setState_id(int state_id) {
		this.state_id = state_id;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public double getFix_30() {
		return fix_30;
	}
	public void setFix_30(double fix_30) {
		this.fix_30 = fix_30;
	}
	public double getFix_20() {
		return fix_20;
	}
	public void setFix_20(double fix_20) {
		this.fix_20 = fix_20;
	}
	public double getFix_15() {
		return fix_15;
	}
	public void setFix_15(double fix_15) {
		this.fix_15 = fix_15;
	}
	public double getArm_3() {
		return arm_3;
	}
	public void setArm_3(double arm_3) {
		this.arm_3 = arm_3;
	}
	public double getArm_5() {
		return arm_5;
	}
	public void setArm_5(double arm_5) {
		this.arm_5 = arm_5;
	}
	public double getArm_7() {
		return arm_7;
	}
	public void setArm_7(double arm_7) {
		this.arm_7 = arm_7;
	}
	public double getArm_10() {
		return arm_10;
	}
	public void setArm_10(double arm_10) {
		this.arm_10 = arm_10;
	}
}
