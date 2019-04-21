package com.iflytek.model;



import org.springframework.stereotype.Component;

@Component("talk")
public class Talk {
 private int t_id;
 private int t_fromid;
 private int t_toid;
 private String t_text;
 private String t_time;
 private String t_title;
 private Person person;
 private Businesser businesser;
 
 
 
 
public Businesser getBusinesser() {
	return businesser;
}
public void setBusinesser(Businesser businesser) {
	this.businesser = businesser;
}
public Person getPerson() {
	return person;
}
public void setPerson(Person person) {
	this.person = person;
}
public String getT_title() {
	return t_title;
}
public void setT_title(String t_title) {
	this.t_title = t_title;
}
public int getT_id() {
	return t_id;
}
public void setT_id(int t_id) {
	this.t_id = t_id;
}
public int getT_fromid() {
	return t_fromid;
}
public void setT_fromid(int t_fromid) {
	this.t_fromid = t_fromid;
}
public int getT_toid() {
	return t_toid;
}
public void setT_toid(int t_toid) {
	this.t_toid = t_toid;
}
public String getT_text() {
	return t_text;
}
public void setT_text(String t_text) {
	this.t_text = t_text;
}
public String getT_time() {
	return t_time;
}
public void setT_time(String t_time) {
	this.t_time = t_time;
}
@Override
public String toString() {
	return "Talk [t_id=" + t_id + ", t_fromid=" + t_fromid + ", t_toid="
			+ t_toid + ", t_text=" + t_text + ", t_time=" + t_time
			+ ", t_title=" + t_title + "]";
}

 
}
