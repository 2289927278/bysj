package com.iflytek.service;







import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iflytek.dao.ManagerDao;

import com.iflytek.model.Manager;


@Service("managerSer")
public class ManagerSer {

	@Autowired
	private ManagerDao managerDao;
	@Autowired
	private Manager manager;

	 public Manager setLogin(String password,String mail){
		 manager= managerDao.setLogin(password,mail);
		 return manager;
	 }
	  
	  public void updateManager(Manager m){
		  managerDao.updateManager(m);
	  }
	  public Manager getManager(int id){
		  manager= managerDao.getManager(id);
		
		  return manager;
	  }
}
