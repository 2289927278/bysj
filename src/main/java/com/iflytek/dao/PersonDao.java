package com.iflytek.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.iflytek.model.Person;
@Repository("personDao")
public interface PersonDao {
   public void register(Person p);//用户注册；
   public Person login(@Param("password")String password,@Param("name")String name);//用户登录
   public List<Person> getListPerson();
   public Person getPerson(int id);
   public void updatePerson(Person p);
   public void deletePerson(int id);  
   public List<Person> getSelectPerson(@Param("username")String username);
   public Person applogin(@Param("phone")String phone,@Param("password")String password);//用户手机登录
  
   
}
