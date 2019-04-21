package com.iflytek.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.iflytek.model.Help;

@Repository("helpDao")
public interface HelpDao {
	public void  addHelp(Help h);
	public void deleteHelp(int id);
	public  void updateHelp(Help h);
	public Help getHelp(int id);
	public List<Help> getHelps(String h_category);
	public List<Help> getListHelp();
	
	public List<Help> getSelectHelp(@Param("h_title")String h_title);

}
