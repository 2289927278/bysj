package com.iflytek.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iflytek.model.Help;

import com.iflytek.service.HelpSer;
import com.iflytek.util.DateUtil;

@Controller
@RequestMapping("/help")
public class HelpCon {
@Autowired 
 private HelpSer helpSer;
@Autowired
private Help help;

	@RequestMapping("/addhelp")
	public String addhelp(HttpServletRequest req){
		String h_time=DateUtil.getTime();
		String h_title=req.getParameter("h_title");
		String h_category=req.getParameter("h_category");
		String h_text=req.getParameter("h_text");
		help.setH_category(h_category);
		help.setH_time(h_time);
		help.setH_text(h_text);
		help.setH_title(h_title);
		helpSer.addHelp(help);
		return "managernews";
		
	}
	@ResponseBody
	@RequestMapping("/getSelect")
	public List<Help> getSelect(HttpServletRequest req){
		String help_title=req.getParameter("help_title");
		req.getSession().setAttribute("help_title", help_title);
		List<Help> list=helpSer.getSelectHelp(help_title);	
		return list;
		
	}
	
	@ResponseBody
	@RequestMapping("/deleteHelp")
	public List<Help> deleteInquiry(HttpServletRequest req){
		int  id=Integer.parseInt(req.getParameter("id"));
		helpSer.deleteHelp(id);
		String help_title=(String) req.getSession().getAttribute("help_title");
		List<Help> list=helpSer.getSelectHelp(help_title);		
		return list;
		
	}
	@ResponseBody
	@RequestMapping("/getcategoryabout")
	public List<Help> getcategoryabout(HttpServletRequest req){
		String h_category=req.getParameter("h_category");
		List<Help> list=helpSer.getHelps(h_category);		
		return list;
		
	}
	
	@ResponseBody
	@RequestMapping("/getnews")
	public List<Help> getnews(HttpServletRequest req){	
		List<Help> list=helpSer.getHelps("发布通知");		
		return list;
		
	}
	
	
	@ResponseBody
	@RequestMapping("/gethelp")
	public Help gethelp(HttpServletRequest req){	
		int  id=Integer.parseInt(req.getParameter("id"));
		help=helpSer.getHelp(id);
		return help;
		
	}
}
