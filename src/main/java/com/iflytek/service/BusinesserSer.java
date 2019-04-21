package com.iflytek.service;





import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iflytek.dao.BusinesserDao;
import com.iflytek.model.Businesser;


@Service("businesserSer")
public class BusinesserSer {

	@Autowired
	private BusinesserDao businesserDao;
	@Autowired
	private Businesser businesser;
	public void register(Businesser b){
		businesserDao.register(b);
	}
    public Businesser login(String password,String name){
    	businesser=businesserDao.login(password,name);
    	return businesser;
    }
    public List<Businesser> getListBusinesser(){
    	List<Businesser> list=businesserDao.getListBusinesser();
    	return list;
    }
    public Businesser getBusinesser(int id){
    	businesser=businesserDao.getBusinesser(id);
    	return businesser;
    }
    public void updateBusinesser(Businesser b){
    	businesserDao.updateBusinesser(b);
    }
	public void deleteBusinesser(int id){
		businesserDao.deleteBusinesser(id);
	}	
	public void updateApplication(@Param("app")String app,@Param("id")int id){
		businesserDao.updateApplication(app, id);
		}
		
	public 	List<Businesser> getSelectBusinesser(String b_application,String b_companyname){
	 List<Businesser> list=businesserDao.getSelectBusinesser(b_application,b_companyname);
    	return list;
	
	}
	 public void updateBusinessera(Businesser b){
		 businesserDao.updateBusinessera(b);
	 }
	 public void updateBusinesserb(Businesser b){
		 businesserDao.updateBusinesserb(b);
	 }
	 
	 
	 public List<Businesser> getSomeBusinesser(String b_application){
		 List<Businesser> list=businesserDao.getSomeBusinesser(b_application);
		 return list;
		 
	 }
	 
	 

	
}
