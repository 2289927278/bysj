package com.iflytek.model;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("businesser")
public class Businesser {
	private int b_id;
	private String b_name;// 公司指定人姓名
	private String b_password;// 登录密码
	private String b_phone;// 公司指定人手机号
	private String b_telephone;// 公司指定人固定电话
	private String b_companyname;// 公司名称
	private String b_shorter;// 公司简称
	private String b_address;// 办公地址
	private String b_postalcode;// 邮政编码
	private String b_companyphone;// 公司电话
	private String b_fax;// 公司传真
	private String b_representative;// 公司法定代表人
	private String b_tax;// 税务登记号
	private String b_mail;// 公司指定人邮箱
	private String b_introduce;// 公司介绍
	private String b_application;// 申请状态
	private int b_state;// 承运商状态
	private int b_reputation;// 信誉值
	private Date b_time;
	private String b_tuname;//图片路径名

	public String getB_tuname() {
		return b_tuname;
	}

	public void setB_tuname(String b_tuname) {
		this.b_tuname = b_tuname;
	}

	public Date getB_time() {
		return b_time;
	}

	public void setB_time(Date b_time) {
		this.b_time = b_time;
	}

	public int getB_id() {
		return b_id;
	}

	public void setB_id(int b_id) {
		this.b_id = b_id;
	}

	public String getB_name() {
		return b_name;
	}

	public void setB_name(String b_name) {
		this.b_name = b_name;
	}

	public String getB_password() {
		return b_password;
	}

	public void setB_password(String b_password) {
		this.b_password = b_password;
	}

	public String getB_phone() {
		return b_phone;
	}

	public void setB_phone(String b_phone) {
		this.b_phone = b_phone;
	}

	public String getB_telephone() {
		return b_telephone;
	}

	public void setB_telephone(String b_telephone) {
		this.b_telephone = b_telephone;
	}

	public String getB_companyname() {
		return b_companyname;
	}

	public void setB_companyname(String b_companyname) {
		this.b_companyname = b_companyname;
	}

	public String getB_shorter() {
		return b_shorter;
	}

	public void setB_shorter(String b_shorter) {
		this.b_shorter = b_shorter;
	}

	public String getB_address() {
		return b_address;
	}

	public void setB_address(String b_address) {
		this.b_address = b_address;
	}

	public String getB_postalcode() {
		return b_postalcode;
	}

	public void setB_postalcode(String b_postalcode) {
		this.b_postalcode = b_postalcode;
	}

	public String getB_companyphone() {
		return b_companyphone;
	}

	public void setB_companyphone(String b_companyphone) {
		this.b_companyphone = b_companyphone;
	}

	public String getB_fax() {
		return b_fax;
	}

	public void setB_fax(String b_fax) {
		this.b_fax = b_fax;
	}

	public String getB_representative() {
		return b_representative;
	}

	public void setB_representative(String b_representative) {
		this.b_representative = b_representative;
	}

	public String getB_tax() {
		return b_tax;
	}

	public void setB_tax(String b_tax) {
		this.b_tax = b_tax;
	}

	public String getB_mail() {
		return b_mail;
	}

	public void setB_mail(String b_mail) {
		this.b_mail = b_mail;
	}

	public String getB_introduce() {
		return b_introduce;
	}

	public void setB_introduce(String b_introduce) {
		this.b_introduce = b_introduce;
	}

	public String getB_application() {
		return b_application;
	}

	public void setB_application(String b_application) {
		this.b_application = b_application;
	}

	public int getB_state() {
		return b_state;
	}

	public void setB_state(int b_state) {
		this.b_state = b_state;
	}

	public int getB_reputation() {
		return b_reputation;
	}

	public void setB_reputation(int b_reputation) {
		this.b_reputation = b_reputation;
	}

	@Override
	public String toString() {
		return "Businesser [b_id=" + b_id + ", b_name=" + b_name
				+ ", b_password=" + b_password + ", b_phone=" + b_phone
				+ ", b_telephone=" + b_telephone + ", b_companyname="
				+ b_companyname + ", b_shorter=" + b_shorter + ", b_address="
				+ b_address + ", b_postalcode=" + b_postalcode
				+ ", b_companyphone=" + b_companyphone + ", b_fax=" + b_fax
				+ ", b_representative=" + b_representative + ", b_tax=" + b_tax
				+ ", b_mail=" + b_mail + ", b_introduce=" + b_introduce
				+ ", b_application=" + b_application + ", b_state=" + b_state
				+ ", b_reputation=" + b_reputation + ", b_time=" + b_time + "]";
	}
	

	

}
