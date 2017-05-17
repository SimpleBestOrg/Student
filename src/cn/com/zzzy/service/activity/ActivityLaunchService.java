package cn.com.zzzy.service.activity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.zzzy.basemapper.activitymapper.ActivityLaunchMapper;
import cn.com.zzzy.entity.ActivityLaunch;

@Service
public class ActivityLaunchService {

       @Autowired
       private ActivityLaunchMapper  activityLaunchMapper;
       
       
       public void insertlaunchActivity(ActivityLaunch activityLaunch){
           activityLaunchMapper.insertlaunchActivity(activityLaunch);
       }
}
