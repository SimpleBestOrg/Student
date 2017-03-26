package cn.com.zzzy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import cn.com.zzzy.basemapper.activitymapper.ActivityMapper;
import cn.com.zzzy.entity.Activity;

@Component
public class ServiceImpl  implements TestService{
		
	@Autowired
	private  ActivityMapper activityMapper; 	
	
	@Override
	public List<Activity> queryList() {
		System.out.println("进入service里面了");
	   return activityMapper.queryList();
	}

}
