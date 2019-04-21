package com.iflytek.model;

import org.springframework.stereotype.Component;

@Component("person")
public class Person {
	private int p_id;
	private String p_name;
	private String p_password;
	private String P_passwords;
	private String P_mail;
	private int p_state;
    private String p_phone;
    private String p_time;
    
	
	
	public String getP_time() {
		return p_time;
	}
	public void setP_time(String p_time) {
		this.p_time = p_time;
	}
	public String getP_phone() {
		return p_phone;
	}
	public void setP_phone(String p_phone) {
		this.p_phone = p_phone;
	}
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_password() {
		return p_password;
	}
	public void setP_password(String p_password) {
		this.p_password = p_password;
	}
	public String getP_passwords() {
		return P_passwords;
	}
	public void setP_passwords(String p_passwords) {
		P_passwords = p_passwords;
	}
	public String getP_mail() {
		return P_mail;
	}
	public void setP_mail(String p_mail) {
		P_mail = p_mail;
	}
	public int getP_state() {
		return p_state;
	}
	public void setP_state(int p_state) {
		this.p_state = p_state;
	}
	@Override
	public String toString() {
		return "Person [p_id=" + p_id + ", p_name=" + p_name + ", p_password="
				+ p_password + ", P_passwords=" + P_passwords + ", P_mail="
				+ P_mail + ", p_state=" + p_state + ", p_phone=" + p_phone
				+ ", p_time=" + p_time + "]";
	}
	
	

}
