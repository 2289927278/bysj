package com.iflytek.service;

import java.util.List;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iflytek.dao.EvaluateDao;

import com.iflytek.model.Evaluate;


@Service("evaluateSer")
public class EvaluateSer {
    @Autowired
    private EvaluateDao evaluateDao;
    
	@Autowired
	private Evaluate evaluate;

	 public void addEvaluate(Evaluate e){
		evaluateDao.addEvaluate(e);
	 }  
	 public List<Evaluate> getListEvaluate(){
		 List<Evaluate> list=evaluateDao.getListEvaluate();
		 return list;
	 }
	 public Evaluate getEvaluate(int id){
		 evaluate=evaluateDao.getEvaluate(id);
		 return evaluate;
	 }
	 public List<Evaluate> getEvaluateA(int e_p_id){
		 List<Evaluate> list=evaluateDao.getEvaluateA(e_p_id);
		 return list;
	 }
	 public List<Evaluate> getEvaluateB(int e_b_id){
		 List<Evaluate> list=evaluateDao.getEvaluateB(e_b_id);
		 return list;
	 }
	 public void deleteEvaluate(int id){
		 evaluateDao.deleteEvaluate(id);
	 }
}
