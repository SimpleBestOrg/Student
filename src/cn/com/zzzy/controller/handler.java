package cn.com.zzzy.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.com.zzzy.entity.Activity;
import cn.com.zzzy.service.ServiceImpl;


@Controller
public class handler {
	
	@Autowired
	private  ServiceImpl ServiceImpl;
	
	
	@RequestMapping("query.action")
	public String query(){
		List<Activity>  list =  ServiceImpl.queryList();
		for (Activity activity : list) {
			System.out.println(activity.getActivityName());
		}
		return "view.jsp";
	}
	
	public ModelAndView query1(){
		ModelAndView view = new ModelAndView();
		view.addObject("fdsa","fdsa");
		view.setViewName("fdsafdsa");
		return view;
	}
}
