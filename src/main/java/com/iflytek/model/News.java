package com.iflytek.model;



import org.springframework.stereotype.Component;

@Component("news")
public class News {
 private int n_id;
 private int n_b_id;
 private String n_title;
 private String n_text;
 private String n_time;
public int getN_id() {
	return n_id;
}
public void setN_id(int n_id) {
	this.n_id = n_id;
}
public int getN_b_id() {
	return n_b_id;
}
public void setN_b_id(int n_b_id) {
	this.n_b_id = n_b_id;
}
public String getN_title() {
	return n_title;
}
public void setN_title(String n_title) {
	this.n_title = n_title;
}
public String getN_text() {
	return n_text;
}
public void setN_text(String n_text) {
	this.n_text = n_text;
}
public String getN_time() {
	return n_time;
}
public void setN_time(String n_time) {
	this.n_time = n_time;
}
@Override
public String toString() {
	return "News [n_id=" + n_id + ", n_b_id=" + n_b_id + ", n_title=" + n_title
			+ ", n_text=" + n_text + ", n_time=" + n_time + ", getN_id()="
			+ getN_id() + ", getN_b_id()=" + getN_b_id() + ", getN_title()="
			+ getN_title() + ", getN_text()=" + getN_text() + ", getN_time()="
			+ getN_time() + ", getClass()=" + getClass() + ", hashCode()="
			+ hashCode() + ", toString()=" + super.toString() + "]";
}
 
}
