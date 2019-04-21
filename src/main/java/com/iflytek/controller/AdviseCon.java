package com.iflytek.controller;



import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import org.springframework.web.bind.annotation.ResponseBody;

import com.iflytek.model.Advise;
import com.iflytek.model.Person;
import com.iflytek.service.AdviseSer;
import com.iflytek.util.DateUtil;

@Controller
@RequestMapping("/advise")
public class AdviseCon {
	
	@Autowired
	private AdviseSer adviseSer;
	@Autowired
	private Advise advise;
	@Autowired
	private Person person;
     
	
	@RequestMapping("addadvise")
	public String addadvise(HttpServletRequest req){
		person=(Person)req.getSession().getAttribute("person");
		int id=person.getP_id();
		
		String a_title=req.getParameter("a_title");
		String a_text=req.getParameter("a_text");
		String a_time=DateUtil.getTime();
		advise.setA_p_id(id);
		advise.setA_title(a_title);
		advise.setA_text(a_text);
		advise.setA_time(a_time);
		adviseSer.addAdvise(advise);
		return "personal";
		
	}
	@RequestMapping("getusernameListAdvise")
	@ResponseBody
	public List<Advise> getusernameListAdvise(){
		List<Advise> list=adviseSer.getusernameListAdvise();
		
		return list;
		
	}
	
	@RequestMapping("delete")
	@ResponseBody
	public List<Advise> delete(HttpServletRequest req){
		int id=Integer.parseInt(req.getParameter("id"));
		adviseSer.delete(id);
		List<Advise> list=adviseSer.getusernameListAdvise();
		
		return list;
		
	}
}
