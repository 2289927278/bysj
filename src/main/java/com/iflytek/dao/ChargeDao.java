package com.iflytek.dao;

import java.util.List;


import org.springframework.stereotype.Repository;

import com.iflytek.model.Charge;



@Repository("chargeDao")
public interface ChargeDao {
	 public void addCharge(Charge c);   
	 public List<Charge> getListCharge();
	 public Charge getCharge(int id);
	 public Charge getChargeA(int c_b_id);
	 public void updateCharge(Charge p);
	 public void deleteCharge(int id);

}
