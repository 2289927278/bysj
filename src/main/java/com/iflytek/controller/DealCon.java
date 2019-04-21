package com.iflytek.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;






import com.iflytek.model.Businesser;
import com.iflytek.model.Charge;
import com.iflytek.model.Deal;
import com.iflytek.model.Person;
import com.iflytek.service.BusinesserSer;
import com.iflytek.service.ChargeSer;
import com.iflytek.service.DealSer;
import com.iflytek.util.UtilPrice;
import com.iflytek.util.UtilRandom;
import com.iflytek.util.UtilSMS;

@Controller
@RequestMapping("/deal")
public class DealCon {
	@Autowired
	private DealSer dealSer;
	@Autowired
	private Deal deal;
	@Autowired
	private Person person;
	@Autowired
	private ChargeSer chargeSer;
	@Autowired
	private Charge charge;
	
	
	@Autowired
	private BusinesserSer businesserSer;
	@Autowired
	private Businesser businesser;
	
	@RequestMapping("/getdeal")
	public String getDeal(HttpServletRequest req){
		person=(Person) req.getSession().getAttribute("person");	
		String number=UtilRandom.getRandomA(10);
		int c_b_id=Integer.parseInt(req.getParameter("c_b_id"));
		charge =chargeSer.getChargeA(c_b_id);
	
		int d_p_id=person.getP_id();
		String weight=req.getParameter("weight");
		
		String c_pay=charge.getC_pay();
		String c_weight=charge.getC_weight();
		String c_add=charge.getC_add();
		
		String price=String.valueOf(UtilPrice.getPrice(c_pay, c_weight, c_add, weight));
		
		
		String fromname=req.getParameter("fromname");
		String fromphone=req.getParameter("fromphone");
		String frommail=req.getParameter("frommail");
		String fromtelephone=req.getParameter("fromtelephone");
		String fromaddress=req.getParameter("fromaddress");
		String toname=req.getParameter("toname");
		String tophone=req.getParameter("tophone");
		String tomail=req.getParameter("tomail");
		String totelephone=req.getParameter("totelephone");		
		String toaddress=req.getParameter("toaddress");
		String remark=req.getParameter("remark");
		
		deal.setD_b_id(c_b_id);
		deal.setD_p_id(d_p_id);
		deal.setD_number(number);
		deal.setD_weight(weight);
		deal.setD_price(price);
		deal.setD_fromname(fromname);
		deal.setD_fromphone(fromphone);
		deal.setD_frommail(frommail);
		deal.setD_fromtelephone(fromtelephone);
		deal.setD_fromaddress(fromaddress);		
		deal.setD_toname(toname);
		deal.setD_tophone(tophone);
		deal.setD_tomail(tomail);
		deal.setD_totelephone(totelephone);
		deal.setD_toaddress(toaddress);		
		deal.setD_remark(remark);		
		dealSer.addDeal(deal);
		return "indexs";
	}
	@ResponseBody
	@RequestMapping("/appgetdeal")
	public void appgetdeal(HttpServletRequest req,HttpServletResponse response){
		response.addHeader("Access-Control-Allow-Origin", "*");
		/*person=(Person) req.getSession().getAttribute("person");*/
		 person=(Person) req.getSession().getAttribute("appperson");
		String number=UtilRandom.getRandomA(10);
		int c_b_id=Integer.parseInt(req.getParameter("c_b_id"));
		System.out.println("c_b_id="+c_b_id);
		charge =chargeSer.getChargeA(94);
	
		int d_p_id=person.getP_id();
		String weight=req.getParameter("weight");
		
		String c_pay=charge.getC_pay();
		String c_weight=charge.getC_weight();
		String c_add=charge.getC_add();
		
		String price=String.valueOf(UtilPrice.getPrice(c_pay, c_weight, c_add, weight));
		
		
		String fromname=req.getParameter("fromname");
		String fromphone=req.getParameter("fromphone");
		String frommail=req.getParameter("frommail");
		
		String fromaddress=req.getParameter("fromaddress");
		String toname=req.getParameter("toname");
		String tophone=req.getParameter("tophone");
		String tomail=req.getParameter("tomail");
			
		String toaddress=req.getParameter("toaddress");
		String remark=req.getParameter("remark");
		
		deal.setD_b_id(c_b_id);
		deal.setD_p_id(d_p_id);
		deal.setD_number(number);
		deal.setD_weight(weight);
		deal.setD_price(price);
		deal.setD_fromname(fromname);
		deal.setD_fromphone(fromphone);
		deal.setD_frommail(frommail);
		deal.setD_fromtelephone("");
		deal.setD_fromaddress(fromaddress);		
		deal.setD_toname(toname);
		deal.setD_tophone(tophone);
		deal.setD_tomail(tomail);
		deal.setD_totelephone("");
		deal.setD_toaddress(toaddress);		
		deal.setD_remark(remark);		
		dealSer.addDeal(deal);
		
	}
	
	//选择查询承运商
		@RequestMapping("/getSelect")
		@ResponseBody
		public List<Deal> getSelect(HttpServletRequest req){
			String d_state=req.getParameter("app");
			req.getSession().setAttribute("deal_state", d_state);
			String d_number=req.getParameter("name");
		    req.getSession().setAttribute("deal_number", d_number);			   
			List<Deal> list=dealSer.getSelectDeal(d_state,d_number);			
			return list;		    
		}
		
		
		//根据承运商的id查自己的交易订单
				@RequestMapping("/getSelectBus")
				@ResponseBody
				public List<Deal> getSelectBus(HttpServletRequest req){
					String d_state=req.getParameter("app");
					req.getSession().setAttribute("deal_state", d_state);
					String d_number=req.getParameter("name");
				    req.getSession().setAttribute("deal_number", d_number);
				    businesser=(Businesser) req.getSession().getAttribute("businesser");
				    int id=businesser.getB_id();
				    
					List<Deal> list=dealSer.getSelectDealBus(d_state,d_number,id);			
					return list;		    
				}
		
		
		//查看订单号详情
			@RequestMapping("/getIdDeal")
			@ResponseBody
			public Deal getIdDeal(HttpServletRequest req){
				int  id=Integer.parseInt(req.getParameter("id"));		
				deal=dealSer.getDeal(id);		
				return deal;	
				
			}
			
			//执行审请通过操作
			@RequestMapping("/updateState")
			@ResponseBody
			public List<Deal> updateState(HttpServletRequest req){
				String d_state=req.getParameter("d_state");
				
				
				int  id=Integer.parseInt(req.getParameter("id"));
                 if(d_state.equals("到站")){
					deal=dealSer.getDeal(id);
					String address=deal.getD_toaddress();
					String phone=deal.getD_tophone();					
					UtilSMS.getAddress(address, phone);
                	 
				}
				dealSer.updataState(d_state,id);
				String deal_state=(String) req.getSession().getAttribute("deal_state");
				String deal_number=(String) req.getSession().getAttribute("deal_number");
				businesser=(Businesser) req.getSession().getAttribute("businesser");
				 int idbus=businesser.getB_id();
				List<Deal> list=dealSer.getSelectDealBus(deal_state, deal_number,idbus);						
				return list;	
				
			}
			
			//商家执行删除操作
			@RequestMapping("/deleteDeal")
			@ResponseBody
			public List<Deal> deleteBusinesser(HttpServletRequest req){			
				int  id=Integer.parseInt(req.getParameter("id"));		
				dealSer.deleteDeal(id);
				String deal_state=(String) req.getSession().getAttribute("deal_state");
				String deal_number=(String) req.getSession().getAttribute("deal_number");
				 businesser=(Businesser) req.getSession().getAttribute("businesser");
				 int idbus=businesser.getB_id();
				List<Deal> list=dealSer.getSelectDealBus(deal_state, deal_number,idbus);						
				return list;	
				
			}
			
			//用户执行删除操作
			@RequestMapping("/deleteDeals")
			@ResponseBody
			public List<Deal> deleteDeals(HttpServletRequest req){			
				int  id=Integer.parseInt(req.getParameter("id"));		
				dealSer.deleteDeals(id);
				person=(Person) req.getSession().getAttribute("person");
				int d_p_id=person.getP_id();
				List<Deal> list=dealSer.getDealA(d_p_id);	
			
				return list;
			}
			
			//用户执行删除操作
			@RequestMapping("/appdeleteDeals")
			@ResponseBody
			public void appdeleteDeals(HttpServletRequest req,HttpServletResponse response){	
				response.addHeader("Access-Control-Allow-Origin", "*");
				int  id=Integer.parseInt(req.getParameter("id"));		
				dealSer.deleteDeals(id);

				
			}
			
			@RequestMapping("/deleteDealuser")
			@ResponseBody
			public List<Deal> deleteDealuser(HttpServletRequest req){			
				int  id=Integer.parseInt(req.getParameter("id"));
				System.out.println(id);
				dealSer.truedelete(id);
				person=(Person) req.getSession().getAttribute("person");
				int d_p_id=person.getP_id();
				List<Deal> list=dealSer.getDealA(d_p_id);	
			
				return list;	
				
			}
			
			
			@RequestMapping("/appdeleteDealuser")
			@ResponseBody
			public void appdeleteDealuser(HttpServletRequest req){			
				int  id=Integer.parseInt(req.getParameter("id"));
				
				dealSer.truedelete(id);
					
				
			}
			
			
			//查询用户自己的交易记录
			@RequestMapping("/getUserDeal")
			@ResponseBody
			public List<Deal> getUserDeal(HttpServletRequest req){
				person=(Person) req.getSession().getAttribute("person");
				int d_p_id=person.getP_id();
				List<Deal> list=dealSer.getDealA(d_p_id);	
			
				return list;		    
			}
			
			
			//app查询用户自己的交易记录
			@RequestMapping("/appgetUserDeal")
			@ResponseBody
			public List<Deal> appgetUserDeal(HttpServletRequest req,HttpServletResponse response){
				response.addHeader("Access-Control-Allow-Origin", "*");
				person=(Person) req.getSession().getAttribute("appperson");
				int d_p_id=person.getP_id();
				List<Deal> list=dealSer.getDealA(d_p_id);	
				return list;		    
			}
			
			
			
			
}
