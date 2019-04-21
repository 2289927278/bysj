package com.iflytek.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.iflytek.model.Manager;



@Repository("managerDao")
public interface ManagerDao {
	
  public Manager setLogin(@Param("password")String password,@Param("mail") String mail);
  
  public void updateManager(Manager m);
  
  public Manager getManager(@Param("id")int id);
	  
  
}
