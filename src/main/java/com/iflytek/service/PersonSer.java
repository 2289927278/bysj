package com.iflytek.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iflytek.dao.PersonDao;
import com.iflytek.model.Person;

@Service("personSer")
public class PersonSer {

	@Autowired
	private PersonDao personDao;

	public void register(Person p) {
		personDao.register(p);
	}

	public Person login(String password, String name) {
		Person p = personDao.login(password,name);
		return p;

	}
	public Person applogin(String phone, String password) {
		Person p = personDao.applogin(phone,password);
		return p;

	}

	public List<Person> getListPerson() {
		List<Person> list = personDao.getListPerson();
		return list;
	}

	public Person getPerson(int id) {
		Person p = personDao.getPerson(id);
		return p;
	}

	public void updatePerson(Person p) {
		personDao.updatePerson(p);
	}

	public void deletePerson(int id) {
		personDao.deletePerson(id);
	}
	public List<Person> getSelectPerson(String username){
		List<Person> list=personDao.getSelectPerson(username);
		return list;
	}
}
