package com.iflytek.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iflytek.model.Businesser;

import com.iflytek.model.News;
import com.iflytek.service.NewsSer;
import com.iflytek.util.DateUtil;

@Controller
@RequestMapping("/news")
public class NewsCon {
	@Autowired
	private NewsSer newsSer;
	@Autowired
	private News news;
	@Autowired
	private Businesser businesser;
	
	@RequestMapping("/addnews")
	public String addNews(HttpServletRequest req){
		businesser=(Businesser) req.getSession().getAttribute("businesser");
		int n_b_id=businesser.getB_id();
		String n_title=req.getParameter("n_title");
		String n_text=req.getParameter("n_text");
		news.setN_b_id(n_b_id);
		news.setN_title(n_title);;
		news.setN_text(n_text);;
		news.setN_time(DateUtil.getTime());
		newsSer.addNews(news);
		return "carriernews";	
	}
	@ResponseBody
	@RequestMapping("/getSelect")
	public List<News> getSelect(HttpServletRequest req){
		businesser=(Businesser) req.getSession().getAttribute("businesser");
		int n_b_id=businesser.getB_id();
		List<News> list=newsSer.getNewsA(n_b_id);
		return list;
		
	}
	
	@ResponseBody
	@RequestMapping("/deleteNews")
	public List<News> deleteNews(HttpServletRequest req){
		int id=Integer.parseInt(req.getParameter("id"));
		newsSer.deleteNews(id);
		businesser=(Businesser) req.getSession().getAttribute("businesser");
		int n_b_id=businesser.getB_id();
		List<News> list=newsSer.getNewsA(n_b_id);
		return list;
	
	}
	
	@ResponseBody
	@RequestMapping("/getlistnews")
	public List<News> getlistnews(HttpServletRequest req){	
		List<News> list=newsSer.getListNews();
		return list;
	
	}
	@ResponseBody
	@RequestMapping("/getnews")
	public News getnews(HttpServletRequest req){
		int id=Integer.parseInt(req.getParameter("id"));
		
		news=newsSer.getNews(id);
		return news;
	
	}
	
	

}
