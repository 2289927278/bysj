package com.iflytek.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iflytek.model.Businesser;
import com.iflytek.model.Charge;
import com.iflytek.service.ChargeSer;

@Controller
@RequestMapping("/charge")
public class ChargeCon {
	@Autowired
	private ChargeSer chargeSer;
	@Autowired
	private Charge charge;
	@Autowired
	private Businesser businesser;
	
	@RequestMapping("/addcharge")
	public String addCharge(HttpServletRequest req){
		businesser=(Businesser) req.getSession().getAttribute("businesser");
		int c_b_id=businesser.getB_id();
	
			String c_b_name=businesser.getB_companyname();		
			String c_name=req.getParameter("c_name");
			String c_pay=req.getParameter("c_pay");
			String c_weight=req.getParameter("c_weight");
			String c_add=req.getParameter("c_add");
			String c_remark=req.getParameter("c_remark");		
			charge.setC_b_id(c_b_id);
			charge.setC_b_name(c_b_name);
			charge.setC_name(c_name);
			charge.setC_pay(c_pay);
			charge.setC_weight(c_weight);
			charge.setC_add(c_add);
			charge.setC_remark(c_remark);
			Charge charge1=chargeSer.getChargeA(c_b_id);
			if(charge1==null){
				chargeSer.addCharge(charge);
			}else{
				int c_id=charge1.getC_id();
				charge.setC_id(c_id);
				chargeSer.updateCharge(charge);
			}
					
			return "carrierperson";
		
	}
	@ResponseBody
	@RequestMapping("/getListCharge")
	public List<Charge> getListCharge(HttpServletRequest req){
		List<Charge> list=chargeSer.getListCharge();
		return list;
	}
	@ResponseBody
	@RequestMapping("/getCharge")
	public Charge getCharge(HttpServletRequest req){
	businesser=(Businesser) req.getSession().getAttribute("businesser");
	int c_b_id=businesser.getB_id();
		Charge charge=chargeSer.getChargeA(c_b_id);
		return charge;
	}

}
