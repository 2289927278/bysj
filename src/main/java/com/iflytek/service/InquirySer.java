package com.iflytek.service;

import java.util.List;






import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iflytek.dao.InquiryDao;
import com.iflytek.model.Inquiry;


@Service("inquirySer")
public class InquirySer {

	@Autowired
	private InquiryDao inquiryDao;
	@Autowired
	private Inquiry inquiry;

	 public void addInquiry(Inquiry i){
		 inquiryDao.addInquiry(i);
	 }  
	 public List<Inquiry> getListInquiry(){
		 List<Inquiry> list=inquiryDao.getListInquiry();
		 return list;
	 }
	 public Inquiry getInquiry(int id){
		 inquiry=inquiryDao.getInquiry(id);
		 return inquiry;
	 }
	 public List<Inquiry> getInquiryA(String i_number,int i_b_id){
		 List<Inquiry> list=inquiryDao.getInquiryA(i_number,i_b_id);
		 return list;
	 }
	 public void deleteInquiry(int id){
		 inquiryDao.deleteInquiry(id);
	 }
	 public List<Inquiry> getI_number(String i_number){
		 List<Inquiry> list=inquiryDao.getI_number(i_number);
		 return list;
	 }
}
