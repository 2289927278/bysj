package com.iflytek.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;




import com.iflytek.model.Deal;

@Repository("dealDao")
public interface DealDao {
	 public void addDeal(Deal d);   
	 public List<Deal> getListDeal();
	 public Deal getDeal(int id);
	 public List<Deal> getDealA(int d_p_id);
	 public List<Deal> getDealB(int d_b_id);
	 public void deleteDeal(int id);
	 public void deleteDeals(int id);
	 public void truedelete(int id); 
	 public List<Deal> getSelectDeal(@Param("d_state")String d_state,@Param("d_number")String d_number); 
	 public void updateState(@Param("d_state")String d_state,@Param("id")int id);
	 public List<Deal> getSelectDealBus(@Param("d_state")String d_state,@Param("d_number")String d_number,@Param("id")int id);

}
