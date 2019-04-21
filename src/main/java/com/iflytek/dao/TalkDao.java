package com.iflytek.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.iflytek.model.Talk;

@Repository("talkDao")
public interface TalkDao {
	 public void addTalk(Talk t);   
	 public List<Talk> getListTalk();
	 public Talk getTalk(int id);
	 public List<Talk> getTalkA(int t_fromid);
	 public List<Talk> getTalkB(@Param("t_toid")int t_toid);
	 public void deleteTalk(int id);
	 public List<Talk> getSelectTalk(@Param("t_fromid")int t_fromid,@Param("name")String name);
	 
	 public List<Talk> getManagerTalk(int t_toid);
	 
	 public void deleteTalbus(int id);
	 public void deleteTalper(int id);
}
