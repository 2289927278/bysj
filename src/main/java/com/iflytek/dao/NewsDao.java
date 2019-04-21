package com.iflytek.dao;

import java.util.List;

import org.springframework.stereotype.Repository;


import com.iflytek.model.News;

@Repository("newsDao")
public interface NewsDao {
	public void addNews(News n);   
	 public List<News> getListNews();
	 public News getNews(int id);
	 public List<News> getNewsA(int n_b_id);	
	 public void deleteNews(int id);

}
