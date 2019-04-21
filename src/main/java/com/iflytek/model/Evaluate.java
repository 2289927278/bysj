 package com.iflytek.model;



import org.springframework.stereotype.Component;
//评价表
@Component("evaluate")
public class Evaluate {
 
	private int e_id;
	private int e_d_id;	
	private String e_text;
	private String e_time;
	private Deal deal;

	public Deal getDeal() {
		return deal;
	}
	public void setDeal(Deal deal) {
		this.deal = deal;
	}
	public int getE_id() {
		return e_id;
	}
	public void setE_id(int e_id) {
		this.e_id = e_id;
	}	
	public int getE_d_id() {
		return e_d_id;
	}
	public void setE_d_id(int e_d_id) {
		this.e_d_id = e_d_id;
	}
	public String getE_text() {
		return e_text;
	}
	public void setE_text(String e_text) {
		this.e_text = e_text;
	}
	public String getE_time() {
		return e_time;
	}
	public void setE_time(String e_time) {
		this.e_time = e_time;
	}
	@Override
	public String toString() {
		return "Evaluate [e_id=" + e_id + ", e_d_id=" + e_d_id + ", e_text="
				+ e_text + ", e_time=" + e_time + ", deal=" + deal + "]";
	}
	
	

	
}
