package com.iflytek.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;



import com.iflytek.model.Evaluate;

@Repository("evaluateDao")
public interface EvaluateDao {
	 public void addEvaluate(Evaluate e);   
	 public List<Evaluate> getListEvaluate();
	 public Evaluate getEvaluate(int id);
	 public List<Evaluate> getEvaluateA(@Param("id")int e_p_id);
	 
	 public List<Evaluate> getEvaluateB(@Param("id")int e_b_id);
	 public void deleteEvaluate(int id);
	 
	 

}
