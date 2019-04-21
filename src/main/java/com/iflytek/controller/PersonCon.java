package com.iflytek.controller;

import java.util.List;

/*import javax.mail.MessagingException;
import javax.mail.internet.AddressException;*/
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;





import com.iflytek.model.Person;
import com.iflytek.service.PersonSer;
import com.iflytek.util.DateUtil;
import com.iflytek.util.UtilMail;
import com.iflytek.util.UtilSMS;

@Controller
@RequestMapping("Person")
public class PersonCon {
	@Autowired
	private PersonSer personSer;
	@Autowired
	private Person p;
   

//开始注册
@RequestMapping("/register")
public String register(HttpServletRequest req){
	  return "login";
}

//注册完成
@RequestMapping("/registers")
public String registers(HttpServletRequest req,HttpServletResponse response){
	response.addHeader("Access-Control-Allow-Origin", "*");
	String name=req.getParameter("name");
	String phone=req.getParameter("phone");
	String password=req.getParameter("password");
	String passwords=req.getParameter("passwords");
	String mail=req.getParameter("mail");
	String time=DateUtil.getTime();
	p.setP_name(name);
    p.setP_phone(phone);
	p.setP_password(password);
	p.setP_passwords(passwords);
	p.setP_mail(mail);
	p.setP_time(time);
	personSer.register(p);
    return "indexs";
}
@ResponseBody
@RequestMapping("/appregister")
public String appregister(HttpServletRequest req,HttpServletResponse response){
	response.addHeader("Access-Control-Allow-Origin", "*");
	String name=req.getParameter("name");
	String phone=req.getParameter("phone");
	String password=req.getParameter("password");
	String passwords=req.getParameter("passwords");
	String mail=req.getParameter("mail");
	String time=DateUtil.getTime();
	p.setP_name(name);
    p.setP_phone(phone);
	p.setP_password(password);
	p.setP_passwords(passwords);
	p.setP_mail(mail);
	p.setP_time(time);
	personSer.register(p);
    return "indexs";
}
@RequestMapping("/userLogin")
public String userLogin(HttpServletRequest req){
	  return "userLogin";
}

@RequestMapping("/back")
public String back(HttpServletRequest req){
	  return "indexs";
}

//用户登录
@RequestMapping("/login")
@ResponseBody
public Person login(HttpServletRequest req){
	String name=req.getParameter("name");
	String password=req.getParameter("password");
    p=personSer.login(password,name);
    if(p==null){  	
    	return p;
    }else{
    	req.getSession().setAttribute("falg", 1);
    	req.getSession().setAttribute("person", p);
    	return p;
    }
    
    
}

//用户登录
@RequestMapping("/applogin")
@ResponseBody
public Person applogin(HttpServletRequest req){
	String phone=req.getParameter("phone");
	String password=req.getParameter("password");
  p=personSer.applogin(phone,password);
  if(p==null){  	
  	return p;
  }else{
  	
  	req.getSession().setAttribute("appperson", p);
  	return p;
  }
   
}

@ResponseBody
@RequestMapping("/appgetPersonal")
public Person appgetPersonal(HttpServletRequest req){	
	 p=(Person) req.getSession().getAttribute("appperson");
	 return p;
	
}

//根据id查用户
@RequestMapping("/getPerson")
@ResponseBody
public Person getPerson(HttpServletRequest req){
	int p_id=Integer.parseInt(req.getParameter("p_id"));
     p=personSer.getPerson(p_id);
     return p;
}

//查所有户
@RequestMapping("/getListPerson")
@ResponseBody
public  List<Person> getListPerson(HttpServletRequest req){	
   List<Person> list=personSer.getListPerson();
   return list;
}

//修改信息
@RequestMapping("/updatePerson")
public String updatePerson(HttpServletRequest req){
	String name=req.getParameter("name");
	String password=req.getParameter("password");
	String passwords=req.getParameter("passwords");
	String mail=req.getParameter("mail");
	String phone=req.getParameter("phone");
	String time=req.getParameter("time");
	p.setP_name(name);
	p.setP_password(password);
	p.setP_passwords(passwords);
	p.setP_mail(mail);
	p.setP_phone(phone);
	p.setP_time(time);
	personSer.updatePerson(p);
    return "personal";
}

//app修改信息
@ResponseBody
@RequestMapping("/appupdatePerson")
public Person appupdatePerson(HttpServletRequest req){
	String name=req.getParameter("name");
	String password=req.getParameter("password");
	String passwords=req.getParameter("passwords");
	String mail=req.getParameter("mail");
	String phone=req.getParameter("phone");
	String time=req.getParameter("time");
	p.setP_name(name);
	p.setP_password(password);
	p.setP_passwords(passwords);
	p.setP_mail(mail);
	p.setP_phone(phone);
	p.setP_time(time);
	personSer.updatePerson(p);
	p=(Person) req.getSession().getAttribute("appperson");
	return p;
  
}



//修改信息
@ResponseBody
@RequestMapping("/deletePerosn")
public List<Person> deletePerosn(HttpServletRequest req){
	int p_id=Integer.parseInt(req.getParameter("id"));
	personSer.deletePerson(p_id);
	List<Person> list=personSer.getListPerson();
	return list;
	
   // return "redirect:getListPerson";
}
//邮箱注册
/*@RequestMapping("/setmail")
@ResponseBody
public String  mail(HttpServletRequest req) throws AddressException, MessagingException{
	String phone=req.getParameter("phone");
	String mailcode= UtilMail.getRandom();
	UtilMail.getMail(mail,mailcode);
	UtilSMS.getRandomNumber(mailcode,phone);
    return mailcode;
}*/


//查所有户
@RequestMapping("/getSelectPerson")
@ResponseBody
public  List<Person> getSelectPerson(HttpServletRequest req){
	String username=req.getParameter("username");
	req.getSession().setAttribute("username", username);
 List<Person> list=personSer.getSelectPerson(username);
 return list;
}

@ResponseBody
@RequestMapping("/deletePerson")
public List<Person> deleteInquiry(HttpServletRequest req){
	int  id=Integer.parseInt(req.getParameter("id"));
	personSer.deletePerson(id);
	String username=(String) req.getSession().getAttribute("username");
    List<Person> list=personSer.getSelectPerson(username);
	 return list;
	
}
@ResponseBody
@RequestMapping("/getPersonal")
public Person getPersonal(HttpServletRequest req){	
	 p=(Person) req.getSession().getAttribute("person");
	 return p;
	
}

}
