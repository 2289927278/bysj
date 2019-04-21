package com.iflytek.model;







import org.springframework.stereotype.Component;
//查询表
@Component("inquiry")
public class Inquiry {
  private int i_id;
  private String i_number;
  private String i_instruction;
  private String i_time;
  private int i_b_id;
  
  
public int getI_b_id() {
	return i_b_id;
}
public void setI_b_id(int i_b_id) {
	this.i_b_id = i_b_id;
}
public int getI_id() {
	return i_id;
}
public void setI_id(int i_id) {
	this.i_id = i_id;
}
public String getI_number() {
	return i_number;
}
public void setI_number(String i_number) {
	this.i_number = i_number;
}
public String getI_instruction() {
	return i_instruction;
}
public void setI_instruction(String i_instruction) {
	this.i_instruction = i_instruction;
}
public String getI_time() {
	return i_time;
}
public void setI_time(String i_time) {
	this.i_time = i_time;
}
@Override
public String toString() {
	return "Inquiry [i_id=" + i_id + ", i_number=" + i_number
			+ ", i_instruction=" + i_instruction + ", i_time=" + i_time + "]";
}
  
	
}
