package com.iflytek.model;

import org.springframework.stereotype.Component;

@Component("manager")
public class Manager {
	private int m_id;
	private String m_name;
	private String m_password;
	private String m_mail;
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_password() {
		return m_password;
	}
	public void setM_password(String m_password) {
		this.m_password = m_password;
	}
	public String getM_mail() {
		return m_mail;
	}
	public void setM_mail(String m_mail) {
		this.m_mail = m_mail;
	}
	@Override
	public String toString() {
		return "Manager [m_id=" + m_id + ", m_name=" + m_name + ", m_password="
				+ m_password + ", m_mail=" + m_mail + "]";
	}
	
	

}
