package com.iflytek.service;

import java.util.List;






import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iflytek.dao.DealDao;
import com.iflytek.model.Deal;


@Service("dealSer")
public class DealSer {

	@Autowired
	private DealDao dealDao;
	@Autowired
	private Deal deal;

	public void addDeal(Deal d){
		dealDao.addDeal(d);
	}   
	 public List<Deal> getListDeal(){
		 List<Deal> list=dealDao.getListDeal();
		 return list;
	 }
	 public Deal getDeal(int id){
		 deal=dealDao.getDeal(id);
		 return deal;
	 }
	 public List<Deal> getDealA(int d_p_id){
		 List<Deal> list=dealDao.getDealA(d_p_id);
		 return list;
	 }
	 public List<Deal> getDealB(int d_b_id){
		 List<Deal> list=dealDao.getDealB(d_b_id);
		 return list;
	 }
	 public void deleteDeal(int id){
		 dealDao.deleteDeal(id);
	 }
	 public void deleteDeals(int id){
		 dealDao.deleteDeals(id);
	 }
	 public void truedelete(int id){
		 dealDao.truedelete(id);
	 }
	 
	 public List<Deal> getSelectDeal(String d_state,String d_number){
		 List<Deal> list=dealDao.getSelectDeal(d_state, d_number);
		 return list;
	 }
	 public void updataState(String d_state,int id){
		 dealDao.updateState(d_state, id);
	 }
	 public List<Deal> getSelectDealBus(String d_state,String d_number,int id){
		 List<Deal> list=dealDao.getSelectDealBus(d_state, d_number,id);
		 return list;
	 }
}
