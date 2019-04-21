package com.iflytek.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iflytek.model.Businesser;
import com.iflytek.model.Inquiry;
import com.iflytek.service.InquirySer;
import com.iflytek.util.DateUtil;

@Controller
@RequestMapping("/inquiry")
public class InquiryCon {

	@Autowired
	private InquirySer inquirySer;
	@Autowired
	private Inquiry inquiry;
	@Autowired
	private Businesser businesser;
	
	@RequestMapping("/addInquiry")
	public String addInquiry(HttpServletRequest req){
		String i_number=req.getParameter("i_number");
		String i_instruction=req.getParameter("content");
		businesser=(Businesser) req.getSession().getAttribute("businesser");
		int i_b_id=businesser.getB_id();
		inquiry.setI_number(i_number);
		inquiry.setI_instruction(i_instruction);
		inquiry.setI_time(DateUtil.getTime());
		inquiry.setI_b_id(i_b_id);
		inquirySer.addInquiry(inquiry);	
		return "carrierinquiry";
		
	}
	@ResponseBody
	@RequestMapping("/getSelect")
	public List<Inquiry> getSelect(HttpServletRequest req){
		String i_number=req.getParameter("in_number");
		req.getSession().setAttribute("inquiry_number", i_number);
		businesser=(Businesser) req.getSession().getAttribute("businesser");
		int i_b_id=businesser.getB_id();
		List<Inquiry> list=inquirySer.getInquiryA(i_number,i_b_id);	
	
		return list;
		
	}
	
	@ResponseBody
	@RequestMapping("/deleteInquiry")
	public List<Inquiry> deleteInquiry(HttpServletRequest req){
		int  id=Integer.parseInt(req.getParameter("id"));
		inquirySer.deleteInquiry(id);
		String i_number=(String) req.getSession().getAttribute("inquiry_number");
		businesser=(Businesser) req.getSession().getAttribute("businesser");
		int i_b_id=businesser.getB_id();
		List<Inquiry> list=inquirySer.getInquiryA(i_number,i_b_id);	
		
		return list;
		
	}
	
	@ResponseBody
	@RequestMapping("/getLookInquiry")
	public List<Inquiry> getLookInquiry(HttpServletRequest req){
		String i_number=req.getParameter("i_number");
		businesser=(Businesser) req.getSession().getAttribute("businesser");
		int i_b_id=businesser.getB_id();
		List<Inquiry> list=inquirySer.getInquiryA(i_number,i_b_id);		
		return list;
		
	}
	
	@ResponseBody
	@RequestMapping("/getI_number")
	public List<Inquiry> getI_number(HttpServletRequest req,HttpServletResponse response){
		response.addHeader("Access-Control-Allow-Origin", "*");
		String i_number=req.getParameter("i_number");
		List<Inquiry> list=inquirySer.getI_number(i_number);		
		return list;
		
	}
	
}
