package com.iflytek.service;

import java.util.List;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.iflytek.dao.TalkDao;

import com.iflytek.model.Talk;

@Service("talkSer")
public class TalkSer {

	@Autowired
	private TalkDao talkDao;
	@Autowired
	private Talk talk;

	 public void addTalk(Talk t){
		 talkDao.addTalk(t);
	 }   
	 public List<Talk> getListTalk(){
		 List<Talk> list=talkDao.getListTalk();
		 return list;
	 }
	 public Talk getTalk(int id){
		 talk=talkDao.getTalk(id);
		 return talk;
	 }
	 public List<Talk> getTalkA(int t_fromid){
		 List<Talk> list=talkDao.getTalkA(t_fromid);
		 return list;
	 }
	 public List<Talk> getTalkB(int t_toid){
		 List<Talk> list=talkDao.getTalkB(t_toid);
		 return list;
	 }
	 public void deleteTalk(int id){
		 talkDao.deleteTalk(id);
	 }
	 public List<Talk> getSelectTalk(int t_fromid,String name){
		 List<Talk> list=talkDao.getSelectTalk(t_fromid,name);
		 return list;
	 }
	 public List<Talk> getManagerTalk(int t_toid){
		 List<Talk> list=talkDao.getManagerTalk(t_toid);
		 return list;
	 }
	 public void deleteTalbus(int id){
		 talkDao.deleteTalbus(id);
	 }
	 public void deleteTalper(int id){
		 talkDao.deleteTalper(id);
	 }
}
