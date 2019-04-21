package com.iflytek.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.iflytek.model.Businesser;



@Repository("businesserDao")
public interface BusinesserDao {
	public void register(Businesser b);//用户注册；
    public Businesser login(@Param("password")String password,@Param("name")String name);//用户登录
    public List<Businesser> getListBusinesser();
    public List<Businesser> getSomeBusinesser(@Param("app")String app);
    public Businesser getBusinesser(int id);
    public void updateBusinesser(Businesser b);
	public void deleteBusinesser(int id);	
	public void updateApplication(@Param("app")String app,@Param("id")int id);
	//选择查询承运商
	public List<Businesser> getSelectBusinesser(@Param("b_application")String b_application,@Param("b_companyname")String b_companyname);
	public void updateBusinessera(Businesser b);
	public void updateBusinesserb(Businesser b);

}
