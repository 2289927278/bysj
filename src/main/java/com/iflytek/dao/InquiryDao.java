package com.iflytek.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;



import com.iflytek.model.Inquiry;

@Repository("inquiryDao")
public interface InquiryDao {
	 public void addInquiry(Inquiry i);   
	 public List<Inquiry> getListInquiry();
	 public Inquiry getInquiry(int id);
	 public List<Inquiry> getInquiryA(@Param("i_number")String i_number,@Param("i_b_id")int i_b_id);
	 public void deleteInquiry(int id);
	 
	 public List<Inquiry> getI_number(@Param("i_number")String i_number);

}
