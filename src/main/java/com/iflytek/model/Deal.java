package com.iflytek.model;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("deal")
public class Deal {
	private int d_id;
	private String d_number;
	private String d_state;
	private int d_p_id;
	private int d_b_id;
	private String d_weight;
	private String d_price;
	private String d_frommail;
	private String d_fromname;
	private String d_fromphone;
	private String d_fromtelephone;
	private String d_fromaddress;
	private String d_tomail;
	private String d_toname;
	private String d_tophone;
	private String d_totelephone;
	private String d_toaddress;
	private Date d_time;
	private String d_remark;
	private String d_flag;
	
	public String getD_flag() {
		return d_flag;
	}
	public void setD_flag(String d_flag) {
		this.d_flag = d_flag;
	}
	public int getD_id() {
		return d_id;
	}
	public void setD_id(int d_id) {
		this.d_id = d_id;
	}
	public String getD_number() {
		return d_number;
	}
	public void setD_number(String d_number) {
		this.d_number = d_number;
	}
	public String getD_state() {
		return d_state;
	}
	public void setD_state(String d_state) {
		this.d_state = d_state;
	}
	public int getD_p_id() {
		return d_p_id;
	}
	public void setD_p_id(int d_p_id) {
		this.d_p_id = d_p_id;
	}
	public int getD_b_id() {
		return d_b_id;
	}
	public void setD_b_id(int d_b_id) {
		this.d_b_id = d_b_id;
	}
	
	public String getD_frommail() {
		return d_frommail;
	}
	public void setD_frommail(String d_frommail) {
		this.d_frommail = d_frommail;
	}
	public String getD_fromname() {
		return d_fromname;
	}
	public void setD_fromname(String d_fromname) {
		this.d_fromname = d_fromname;
	}
	public String getD_fromphone() {
		return d_fromphone;
	}
	public void setD_fromphone(String d_fromphone) {
		this.d_fromphone = d_fromphone;
	}
	public String getD_fromtelephone() {
		return d_fromtelephone;
	}
	public void setD_fromtelephone(String d_fromtelephone) {
		this.d_fromtelephone = d_fromtelephone;
	}
	public String getD_fromaddress() {
		return d_fromaddress;
	}
	public void setD_fromaddress(String d_fromaddress) {
		this.d_fromaddress = d_fromaddress;
	}
	public String getD_tomail() {
		return d_tomail;
	}
	public void setD_tomail(String d_tomail) {
		this.d_tomail = d_tomail;
	}
	public String getD_toname() {
		return d_toname;
	}
	public void setD_toname(String d_toname) {
		this.d_toname = d_toname;
	}
	public String getD_tophone() {
		return d_tophone;
	}
	public void setD_tophone(String d_tophone) {
		this.d_tophone = d_tophone;
	}
	public String getD_totelephone() {
		return d_totelephone;
	}
	public void setD_totelephone(String d_totelephone) {
		this.d_totelephone = d_totelephone;
	}
	public String getD_toaddress() {
		return d_toaddress;
	}
	public void setD_toaddress(String d_toaddress) {
		this.d_toaddress = d_toaddress;
	}
	public Date getD_time() {
		return d_time;
	}
	public void setD_time(Date d_time) {
		this.d_time = d_time;
	}
	public String getD_remark() {
		return d_remark;
	}
	public void setD_remark(String d_remark) {
		this.d_remark = d_remark;
	}
	public String getD_weight() {
		return d_weight;
	}
	public void setD_weight(String d_weight) {
		this.d_weight = d_weight;
	}
	public String getD_price() {
		return d_price;
	}
	public void setD_price(String d_price) {
		this.d_price = d_price;
	}
	@Override
	public String toString() {
		return "Deal [d_id=" + d_id + ", d_number=" + d_number + ", d_state="
				+ d_state + ", d_p_id=" + d_p_id + ", d_b_id=" + d_b_id
				+ ", d_weight=" + d_weight + ", d_price=" + d_price
				+ ", d_frommail=" + d_frommail + ", d_fromname=" + d_fromname
				+ ", d_fromphone=" + d_fromphone + ", d_fromtelephone="
				+ d_fromtelephone + ", d_fromaddress=" + d_fromaddress
				+ ", d_tomail=" + d_tomail + ", d_toname=" + d_toname
				+ ", d_tophone=" + d_tophone + ", d_totelephone="
				+ d_totelephone + ", d_toaddress=" + d_toaddress + ", d_time="
				+ d_time + ", d_remark=" + d_remark + ", d_flag=" + d_flag
				+ "]";
	}
	
	
	
	
	
	
	

}
