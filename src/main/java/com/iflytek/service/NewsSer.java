package com.iflytek.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iflytek.dao.NewsDao;

import com.iflytek.model.News;


@Service("newsSer")
public class NewsSer {

	@Autowired
	private NewsDao newsDao;
	@Autowired
	private News news;

	public void addNews(News n) {
		newsDao.addNews(n);
	}

	public List<News> getListNews() {
		List<News> list = newsDao.getListNews();
		return list;
	}

	public News getNews(int id) {
		news = newsDao.getNews(id);
		return news;
	}

	public List<News> getNewsA(int n_b_id) {
		List<News> list = newsDao.getNewsA(n_b_id);
		return list;
	}

	  public void deleteNews(int id) {
		newsDao.deleteNews(id);
	}
}
