package com.iflytek.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iflytek.model.Businesser;
import com.iflytek.model.Person;
import com.iflytek.model.Talk;
import com.iflytek.service.PersonSer;
import com.iflytek.service.TalkSer;
import com.iflytek.util.DateUtil;

@Controller
@RequestMapping("/talk")
public class TalkCon {
	@Autowired
	private TalkSer talkSer;
	@Autowired
    private Talk talk;
	@Autowired
 	private Businesser businesser;
	@Autowired
	private Person person;
	@Autowired
	private PersonSer personSer;
	
	
	
	@RequestMapping("addtalk")
	public String addtalk(HttpServletRequest req){
		businesser=(Businesser) req.getSession().getAttribute("businesser");
		int b_id=businesser.getB_id();	
		int p_id=Integer.parseInt(req.getParameter("p_id"));
		String talktitle=req.getParameter("talktitle");
		String talktext=req.getParameter("talktext");
		if(talktext.equals("")){
			return "carriertouser";
		}
		else{
			talk.setT_fromid(b_id);
			talk.setT_toid(p_id);
			talk.setT_title(talktitle);
			talk.setT_text(talktext);
			talk.setT_time(DateUtil.getTime());
			talkSer.addTalk(talk);
			return "carriertouser";
		}
		
		
		
	}
	
	@ResponseBody
	@RequestMapping("/getSelect")
	public List<Talk> getSelectTalk(HttpServletRequest req){
	
		businesser=(Businesser) req.getSession().getAttribute("businesser");
		int b_id=businesser.getB_id();	
		List<Talk> list=talkSer.getSelectTalk(b_id,null);
		/*System.out.println(list);*/
		
		return list;
	
		
	}
	@ResponseBody
	@RequestMapping("/deleteTalk")
	public List<Talk> deleteTalk(HttpServletRequest req){
		int id=Integer.parseInt(req.getParameter("id"));	
		talkSer.deleteTalk(id);
		businesser=(Businesser) req.getSession().getAttribute("businesser");
		int b_id=businesser.getB_id();	
		List<Talk> list=talkSer.getSelectTalk(b_id,"");		
		return list;
	
		
	}
	
	
	@ResponseBody
	@RequestMapping("/getTalkB")
	public List<Talk> getTalkB(HttpServletRequest req){
	
		person=(Person) req.getSession().getAttribute("person");
		int id=person.getP_id();	
		List<Talk> list=talkSer.getTalkB(id);	
		return list;
	
	}
	@ResponseBody
	@RequestMapping("/appgetTalkB")
	public List<Talk> appgetTalkB(HttpServletRequest req){
	
		person=(Person) req.getSession().getAttribute("appperson");
		int id=person.getP_id();	
		List<Talk> list=talkSer.getTalkB(id);	
		return list;
	
	}
	@ResponseBody
	@RequestMapping("/userdeleteTalk")
	public List<Talk> userdeleteTalk(HttpServletRequest req){
		int id=Integer.parseInt(req.getParameter("id"));	
		talkSer.deleteTalk(id);
		person=(Person) req.getSession().getAttribute("person");
		int p_id=person.getP_id();	
		List<Talk> list=talkSer.getTalkB(p_id);			
		return list;
	
		
	}
	
	@ResponseBody
	@RequestMapping("/getManagerTalk")
	public List<Talk> getManagerTalk(HttpServletRequest req){
	
		businesser=(Businesser) req.getSession().getAttribute("businesser");
		int id=businesser.getB_id();	
		List<Talk> list=talkSer.getManagerTalk(id);	
		return list;
	
		
	}
	@ResponseBody
	@RequestMapping("/carrierdeleteTalk")
	public List<Talk> carrierdeleteTalk(HttpServletRequest req){
		int id=Integer.parseInt(req.getParameter("id"));	
		talkSer.deleteTalk(id);
		businesser=(Businesser) req.getSession().getAttribute("businesser");
		int b_id=businesser.getB_id();	
		List<Talk> list=talkSer.getManagerTalk(b_id);	
		return list;
	
		
	}
	
	@ResponseBody
	@RequestMapping("/deleteTalbus")
	public List<Talk> deleteTalbus(HttpServletRequest req){
		int id=Integer.parseInt(req.getParameter("id"));	
		talkSer.deleteTalbus(id);
		businesser=(Businesser) req.getSession().getAttribute("businesser");
		int b_id=businesser.getB_id();	
		List<Talk> list=talkSer.getSelectTalk(b_id,"");	
		return list;
		
	}
	
	
	
	@ResponseBody
	@RequestMapping("/deleteTalper")
	public List<Talk> deleteTalper(HttpServletRequest req){
		int id=Integer.parseInt(req.getParameter("id"));	
		talkSer.deleteTalper(id);
		person=(Person) req.getSession().getAttribute("person");
		int p_id=person.getP_id();	
		List<Talk> list=talkSer.getTalkB(p_id);			
		return list;
	
		
	}
	
	
	@ResponseBody
	@RequestMapping("/getSelectTalk")
	public List<Talk> getSelectTalka(HttpServletRequest req){
		String name=req.getParameter("name");
		businesser=(Businesser) req.getSession().getAttribute("businesser");
		int id=businesser.getB_id();	
		List<Talk> list=talkSer.getSelectTalk(id, name);	
		return list;
	
		
	}
	@ResponseBody
	@RequestMapping("/appgetTalk")
	public Talk appgetTalk(HttpServletRequest req){
		int id=Integer.parseInt(req.getParameter("id"));
		talk=talkSer.getTalk(id);	
		return talk;
	
		
	}
	
	

}
