package com.iflytek.model;



import org.springframework.stereotype.Component;

@Component("advise")
public class Advise {

	private int a_id;
	private int a_p_id;
	private String a_title;
	private String a_text;
	private String a_time;
	private Person person;
	
	
	public Person getPerson() {
		return person;
	}
	public void setPerson(Person person) {
		this.person = person;
	}
	public int getA_id() {
		return a_id;
	}
	public void setA_id(int a_id) {
		this.a_id = a_id;
	}
	public int getA_p_id() {
		return a_p_id;
	}
	public void setA_p_id(int a_p_id) {
		this.a_p_id = a_p_id;
	}
	public String getA_title() {
		return a_title;
	}
	public void setA_title(String a_title) {
		this.a_title = a_title;
	}
	public String getA_text() {
		return a_text;
	}
	public void setA_text(String a_text) {
		this.a_text = a_text;
	}
	public String getA_time() {
		return a_time;
	}
	public void setA_time(String a_time) {
		this.a_time = a_time;
	}
	@Override
	public String toString() {
		return "Advise [a_id=" + a_id + ", a_p_id=" + a_p_id + ", a_title="
				+ a_title + ", a_text=" + a_text + ", a_time=" + a_time
				+ ", person=" + person + "]";
	}
	
}
