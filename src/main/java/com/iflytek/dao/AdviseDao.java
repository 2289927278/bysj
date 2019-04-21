package com.iflytek.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.iflytek.model.Advise;

@Repository("adviseDao")
public interface AdviseDao {
  public void addAdvise(Advise a);
  
  public List<Advise> getListAdvise();
  
  public List<Advise> getusernameListAdvise();
  
  public void delete(int id);
  

}
