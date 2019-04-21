package com.iflytek.service;





import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;




import com.iflytek.dao.AdviseDao;
import com.iflytek.model.Advise;


@Service("adviseSer")
public class AdviseSer {

	@Autowired
	private Advise advise;
	@Autowired
	private AdviseDao adviseDao;
	
	 public void addAdvise(Advise a){
		 adviseDao.addAdvise(a);
	 }
	 
	  
	  public List<Advise> getListAdvise() {
	   List<Advise> list=adviseDao.getListAdvise();
	     return list;
	}
	  public List<Advise> getusernameListAdvise(){
		 List<Advise> list=adviseDao.getusernameListAdvise();
		     return list;
	  }
	  public void delete(int id){
		adviseDao.delete(id);  
	  }
      
	
}
