package com.iflytek.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.iflytek.model.Businesser;
import com.iflytek.service.BusinesserSer;
import com.iflytek.util.UtilSMS;

@Controller
@RequestMapping("/businesser")
public class BusinesserCon {
	@Autowired
	private Businesser businesser;
	@Autowired
	private BusinesserSer businesserSer;
	  
	  
	//进入登录界面
	@RequestMapping("/login")
	public String login(HttpServletRequest req){
	
		 return "carrierlogin";
	}
	
	//登录验证
	@RequestMapping("/getlogin")
	@ResponseBody
	public Businesser getlogin(HttpServletRequest req){
		String password=req.getParameter("password");
		String name=req.getParameter("name");
		
		businesser=businesserSer.login(password, name);
	    if(businesser==null){  	
	    	return businesser;
	    }else{
	    	req.getSession().setAttribute("falg", 2);
	    	req.getSession().setAttribute("businesser", businesser);
	    	return businesser;
	    }
	    
	}
	//验证成功进入的主页面
	@RequestMapping("/carriermain")
	public String carriermain(HttpServletRequest req){
	
		 return "carriermain";
	}
	    
	//承运商注册
	@RequestMapping("/addbusinesser")
	public String addbusinesser(HttpServletRequest req){
	   String b_name=req.getParameter("b_name");
	   String b_password=req.getParameter("b_password");
	   String b_phone=req.getParameter("b_phone");
	   String b_telephone=req.getParameter("b_telephone");
	   String b_mail=req.getParameter("b_mail");
	   String b_companyname=req.getParameter("b_companyname");
	   String b_shorter=req.getParameter("b_shorter");
	   String b_address=req.getParameter("b_address");
	   String b_postalcode=req.getParameter("b_postalcode");
	   String b_companyphone=req.getParameter("b_companyphone");
	   String b_fax=req.getParameter("b_fax");
	   String b_representative=req.getParameter("b_representative");
	   String b_tax=req.getParameter("b_tax");
	   String b_introduce=req.getParameter("b_introduce");
	   String b_tuname=(String) req.getSession().getAttribute("pahts");
	   
	   businesser.setB_name(b_name);
	   businesser.setB_password(b_password);
	   businesser.setB_phone(b_phone);
	   businesser.setB_telephone(b_telephone);
	   businesser.setB_mail(b_mail);
	   businesser.setB_companyname(b_companyname);
	   businesser.setB_shorter(b_shorter);
	   businesser.setB_address(b_address);
	   businesser.setB_postalcode(b_postalcode);
	   businesser.setB_companyphone(b_companyphone);
	   businesser.setB_fax(b_fax);
	   businesser.setB_representative(b_representative);
	   businesser.setB_tax(b_tax);
	   businesser.setB_introduce(b_introduce);
	   businesser.setB_tuname(b_tuname);
	   businesserSer.register(businesser);
	   req.getSession().setAttribute("falg", 0);
		 return "indexs";
	}
	//选择查询承运商
	@RequestMapping("/getSelect")
	@ResponseBody
	public List<Businesser> getSelect(HttpServletRequest req){
		String b_application=req.getParameter("app");
		req.getSession().setAttribute("appstate", b_application);
		String name=req.getParameter("name");
	    req.getSession().setAttribute("namestate", name);			   
		List<Businesser> list=businesserSer.getSelectBusinesser(b_application,name);
		
		return list;		    
	}
	
	
	//查看承运商详情
	@ResponseBody
	@RequestMapping("/getBusinessers")
	public Businesser getBusinesser(HttpServletRequest req,HttpServletResponse response){
	response.addHeader("Access-Control-Allow-Origin", "*");
		int  id=Integer.parseInt(req.getParameter("id"));		
		businesser=businesserSer.getBusinesser(id);		 
		return businesser;	
		
	}
	
	
		@RequestMapping("/getBusinesser")
		public String getBusinesser(HttpServletRequest req,Model model){
			int  id=Integer.parseInt(req.getParameter("id"));		
			/*businesser=businesserSer.getBusinesser(id);*/	
			 model.addAttribute("id",id);
			return "businesserdemo";	
			
		}
		@ResponseBody
		@RequestMapping("/getBusinesserper")
		public Businesser getBusinesserper(HttpServletRequest req){			
		businesser=(Businesser) req.getSession().getAttribute("businesser");
			return businesser;	
			
		}
		//执行审请通过操作
		@RequestMapping("/updateApplication")
		@ResponseBody
		public List<Businesser> updateApplication(HttpServletRequest req){
			String app=req.getParameter("appval");
			/*UtilSMS.getxx(app, "15755184185");*/
			int  id=Integer.parseInt(req.getParameter("id"));
			businesser=businesserSer.getBusinesser(id);
			String phone=businesser.getB_phone();
			/*UtilSMS.getxx(app, phone);*/
			businesserSer.updateApplication(app,id);
			String appstate=(String) req.getSession().getAttribute("appstate");
			String appname=(String) req.getSession().getAttribute("namestate");
			List<Businesser> list=businesserSer.getSelectBusinesser(appstate, appname);
			
			return list;	
			
		}
		
		//执行删除操作
		@RequestMapping("/deleteBusinesser")
		@ResponseBody
		public List<Businesser> deleteBusinesser(HttpServletRequest req){			
			int  id=Integer.parseInt(req.getParameter("id"));		
			businesserSer.deleteBusinesser(id);
			String appstate=(String) req.getSession().getAttribute("appstate");
			String appname=(String) req.getSession().getAttribute("namestate");
			List<Businesser> list=businesserSer.getSelectBusinesser(appstate, appname);		
			return list;	
			
		}
		
		@RequestMapping("/File")
		/*@RequestParam String name*/
		public String regist(@RequestParam("head") MultipartFile file,HttpServletRequest request,ModelMap model){
			//文件保存的时候,一定要知道文件决定路径
			String path =request.getServletContext().getRealPath("imgs");
			 String fileName = file.getOriginalFilename();
			 System.out.println(fileName);
			//System.out.println(path);
			File uploadFile = new File(path,fileName);
			//System.out.println(uploadFile);
			//System.out.println(request.getContextPath()+"/update/"+fileName);
			try {
				file.transferTo(uploadFile);
			} catch (IllegalStateException e) {
				
				e.printStackTrace();
			} catch (IOException e) {
				
				e.printStackTrace();
			}
			String paths="http://192.168.43.16:8888"+request.getContextPath()+"/imgs/"+fileName;
			request.getSession().setAttribute("pahts", paths);
			model.addAttribute("fileUrl", paths);
			//model.addAttribute("fileUrl",uploadFile);
			System.out.println(paths);
			return "carrier";
	
		}
		/*@ResponseBody
		@RequestMapping("/getBuinesser")
		public Businesser getBuinesser(HttpServletRequest req){
		   businesser=(Businesser) req.getSession().getAttribute("businesser");
		   int id=businesser.getB_id();
		   businesser=businesserSer.getBusinesser(id);
		   return businesser;
		   
			
		}
	*/
		
	
		@RequestMapping("/updatebusinessera")
		public String updatebusinessera(HttpServletRequest req){
		   businesser=(Businesser) req.getSession().getAttribute("businesser");
		   int id=businesser.getB_id();
		 
		   String name=req.getParameter("name");
		   String password=req.getParameter("password");
		   String telephone =req.getParameter("telephone");	   
		   businesser.setB_id(id);
		   businesser.setB_name(name);
		   businesser.setB_password(password);
		   businesser.setB_telephone(telephone);
		   businesserSer.updateBusinessera(businesser);
		   
		
		   return "carrierperson";
		   
			
		}
		
		@RequestMapping("/updatebusinesserb")
		public String updatebusinesserb(HttpServletRequest req){
		   businesser=(Businesser) req.getSession().getAttribute("businesser");
		   int id=businesser.getB_id();
		  
		   String b_introduce =req.getParameter("b_introduce");	   
		   businesser.setB_id(id);
		   businesser.setB_introduce(b_introduce);
		   
		   businesserSer.updateBusinesserb(businesser);
		   return "carrierperson";
		   
			
		}
		
		//承运商列表
		@ResponseBody
		@RequestMapping("/getListB")
		public List<Businesser> getListB(HttpServletRequest req,HttpServletResponse response){	
		response.addHeader("Access-Control-Allow-Origin", "*");
		List<Businesser> list=businesserSer.getSomeBusinesser("审请通过");
		   return list;
		   
			
		}
		
		
	
		
}
