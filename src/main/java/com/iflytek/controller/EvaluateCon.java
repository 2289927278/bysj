package com.iflytek.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iflytek.model.Businesser;
import com.iflytek.model.Evaluate;
import com.iflytek.model.Person;
import com.iflytek.service.EvaluateSer;
import com.iflytek.util.DateUtil;

@Controller
@RequestMapping("/evaluate")
public class EvaluateCon {
	@Autowired
	private EvaluateSer evaluateSer;
	@Autowired
	private Evaluate evaluate;
	@Autowired
	private Person person;
	@Autowired
	private Businesser businesser;
	
	@RequestMapping("/addevaluate")
	public String addevaluate(HttpServletRequest req){
		int e_d_id=Integer.parseInt(req.getParameter("e_d_id"));
		String e_text=req.getParameter("talktext");
		evaluate.setE_d_id(e_d_id);
		evaluate.setE_text(e_text);
		evaluate.setE_time(DateUtil.getTime());
		evaluateSer.addEvaluate(evaluate);
		return "personal";
		
	}
	@ResponseBody
	@RequestMapping("/appaddevaluate")
	public String appaddevaluate(HttpServletRequest req){
		int e_d_id=Integer.parseInt(req.getParameter("e_d_id"));
		String e_text=req.getParameter("talktext");
		evaluate.setE_d_id(e_d_id);
		evaluate.setE_text(e_text);
		evaluate.setE_time(DateUtil.getTime());
		evaluateSer.addEvaluate(evaluate);
		return "personal";
		
	}
	@ResponseBody
	@RequestMapping("/getmyevaluate")
	public List<Evaluate> getmyevaluate(HttpServletRequest req){
		person=(Person)req.getSession().getAttribute("person");
		int p_id=person.getP_id();
		System.out.println(p_id);
		List<Evaluate> list=evaluateSer.getEvaluateA(p_id);
		return list;
		
	}
	@ResponseBody
	@RequestMapping("/appgetmyevaluate")
	public List<Evaluate> appgetmyevaluate(HttpServletRequest req){
		person=(Person)req.getSession().getAttribute("appperson");
		int p_id=person.getP_id();
		
		List<Evaluate> list=evaluateSer.getEvaluateA(p_id);
		return list;
		
	}
	
	@ResponseBody
	@RequestMapping("/appgetEvaluate")
	public Evaluate appgetEvaluate(HttpServletRequest req){
		int id=Integer.parseInt(req.getParameter("id"));
		evaluate=evaluateSer.getEvaluate(id);
		return evaluate;
		
	}
	
	@ResponseBody
	@RequestMapping("/deleteevaluate")
	public List<Evaluate> deleteevaluate(HttpServletRequest req){
		int id=Integer.parseInt(req.getParameter("id"));
		evaluateSer.deleteEvaluate(id);
		person=(Person)req.getSession().getAttribute("person");
		int p_id=person.getP_id();

		List<Evaluate> list=evaluateSer.getEvaluateA(p_id);
	
		return list;
		
	}
	
	@ResponseBody
	@RequestMapping("/getcarrierevaluate")
	public List<Evaluate> getcarrierevaluate(HttpServletRequest req){
		businesser=(Businesser)req.getSession().getAttribute("businesser");
		int b_id=businesser.getB_id();
		List<Evaluate> list=evaluateSer.getEvaluateB(b_id);
	
		return list;
		
	}
	
	
	
	//查看每个商家的评价
	@ResponseBody
	@RequestMapping("/lookevaluate")
	public List<Evaluate> lookevaluate(HttpServletRequest req,HttpServletResponse response){
		response.addHeader("Access-Control-Allow-Origin", "*");
		int id=Integer.parseInt(req.getParameter("id"));
		List<Evaluate> list=evaluateSer.getEvaluateB(id);
		return list;
		
	}
	
	

}
