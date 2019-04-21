package com.iflytek.service;

import java.util.List;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iflytek.dao.ChargeDao;

import com.iflytek.model.Charge;


@Service("chargeSer")
public class ChargeSer {

	@Autowired
	private ChargeDao chargeDao;
	@Autowired
	private Charge charge;
	

	 public void addCharge(Charge c){
		 chargeDao.addCharge(c);
	 }  
	 public List<Charge> getListCharge(){
		 List<Charge> list=chargeDao.getListCharge();
		 return list;
	 }
	 public Charge getCharge(int id){
		 charge=chargeDao.getCharge(id);
		 return charge;
	 }
	 public Charge getChargeA(int c_b_id){
		charge =chargeDao.getChargeA(c_b_id);
		 return charge;
	 }
	 public void updateCharge(Charge p){
		 chargeDao.updateCharge(p);
	 }
	 public void deleteCharge(int id){
		 chargeDao.deleteCharge(id);
	 }
}
