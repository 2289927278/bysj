package com.iflytek.model;



import org.springframework.stereotype.Component;

@Component("help")
public class Help {
	private int h_id;
	private String h_category;
	private String h_title;
	private String h_text;
	private String h_time;
	public int getH_id() {
		return h_id;
	}
	public void setH_id(int h_id) {
		this.h_id = h_id;
	}
	public String getH_category() {
		return h_category;
	}
	public void setH_category(String h_category) {
		this.h_category = h_category;
	}
	public String getH_title() {
		return h_title;
	}
	public void setH_title(String h_title) {
		this.h_title = h_title;
	}
	public String getH_text() {
		return h_text;
	}
	public void setH_text(String h_text) {
		this.h_text = h_text;
	}
	public String getH_time() {
		return h_time;
	}
	public void setH_time(String h_time) {
		this.h_time = h_time;
	}
	@Override
	public String toString() {
		return "Help [h_id=" + h_id + ", h_category=" + h_category
				+ ", h_title=" + h_title + ", h_text=" + h_text + ", h_time="
				+ h_time + "]";
	}
	

}
