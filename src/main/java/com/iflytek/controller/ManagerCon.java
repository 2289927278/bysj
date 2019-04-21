package com.iflytek.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iflytek.model.Manager;
import com.iflytek.service.ManagerSer;

@Controller
@RequestMapping("/manager")
public class ManagerCon {
	@Autowired
	private ManagerSer managerSer;
	@Autowired
	private Manager manager;
	 
	 
	@RequestMapping("/setlogin")
	public String setlogin(HttpServletRequest req){
		
		return "managerlogin";
	}
	
	@RequestMapping("/main")
	public String loginMain(HttpServletRequest req){
		
		return "managermain";
	}
	
	
	@ResponseBody
	@RequestMapping("/login")
	public Manager login(HttpServletRequest req){
		String name=req.getParameter("name");
		String password=req.getParameter("password");
		manager=managerSer.setLogin(password, name);
	    if(manager==null){  	
	    	return manager;
	    }else{
	    	req.getSession().setAttribute("falg", 3);
	    	req.getSession().setAttribute("manager", manager);
	    	return manager;
	    }
		
	}
	
	@ResponseBody
	@RequestMapping("/getManager")
	public Manager getManager(HttpServletRequest req){
		manager=(Manager) req.getSession().getAttribute("manager");
		int id=manager.getM_id();
		manager=managerSer.getManager(id);
		
		return manager;
	}
	
	@RequestMapping("updateManager")
	public String updateManager(HttpServletRequest req){
		manager=(Manager) req.getSession().getAttribute("manager");
		int id=manager.getM_id();
	    String name=req.getParameter("name");
	    String password=req.getParameter("password");
	    String mail=req.getParameter("mail");
	    manager.setM_id(id);
	    manager.setM_name(name);
	    manager.setM_password(password);
	    manager.setM_mail(mail);
	    
	    managerSer.updateManager(manager);
		return "managerinformation";
	}

}
