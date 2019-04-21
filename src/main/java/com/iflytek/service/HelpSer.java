package com.iflytek.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iflytek.dao.HelpDao;

import com.iflytek.model.Help;


@Service("helpSer")
public class HelpSer {

	@Autowired
	private HelpDao helpDao;
	@Autowired
	private Help help;

	public void  addHelp(Help h){
		helpDao.addHelp(h);
	}
	public void deleteHelp(int id){
		helpDao.deleteHelp(id);
	}
	public  void updateHelp(Help h){
		helpDao.updateHelp(h);
	}
	public Help getHelp(int id){
		help=helpDao.getHelp(id);
		return help;
	}
	public List<Help> getHelps(String h_category){
		List<Help> list=helpDao.getHelps(h_category);
		return list;
	}
	public List<Help> getListHelp(){
		List<Help> list=helpDao.getListHelp();
		return list;
	}
	
	public List<Help> getSelectHelp(String h_title){
		List<Help> list=helpDao.getSelectHelp(h_title);
		return list;
	}
	
	
}
