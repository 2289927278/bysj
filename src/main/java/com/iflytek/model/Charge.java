package com.iflytek.model;

import java.sql.Date;

import org.springframework.stereotype.Component;
//收费标准表
@Component("charge")
public class Charge {

	private int c_id;
	private int c_b_id;
	private String c_b_name;
	private String c_name;
	private String c_pay;
	private String c_weight;
	private String c_add;
	private String c_remark;
	private Date c_time;
	
	public Date getC_time() {
		return c_time;
	}
	public void setC_time(Date c_time) {
		this.c_time = c_time;
	}
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
	public int getC_b_id() {
		return c_b_id;
	}
	public void setC_b_id(int c_b_id) {
		this.c_b_id = c_b_id;
	}
	public String getC_b_name() {
		return c_b_name;
	}
	public void setC_b_name(String c_b_name) {
		this.c_b_name = c_b_name;
	}
	public String getC_pay() {
		return c_pay;
	}
	public void setC_pay(String c_pay) {
		this.c_pay = c_pay;
	}
	public String getC_weight() {
		return c_weight;
	}
	public void setC_weight(String c_weight) {
		this.c_weight = c_weight;
	}
	public String getC_add() {
		return c_add;
	}
	public void setC_add(String c_add) {
		this.c_add = c_add;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_remark() {
		return c_remark;
	}
	public void setC_remark(String c_remark) {
		this.c_remark = c_remark;
	}
	@Override
	public String toString() {
		return "Charge [c_id=" + c_id + ", c_b_id=" + c_b_id + ", c_b_name="
				+ c_b_name + ", c_name=" + c_name + ", c_pay=" + c_pay
				+ ", c_weight=" + c_weight + ", c_add=" + c_add + ", c_remark="
				+ c_remark + ", c_time=" + c_time + "]";
	}
	
	
}
