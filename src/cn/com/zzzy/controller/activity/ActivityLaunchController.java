package cn.com.zzzy.controller.activity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.com.zzzy.entity.Activity;
import cn.com.zzzy.entity.ActivityLaunch;
import cn.com.zzzy.entity.ActivityLaunchPhoto;
import cn.com.zzzy.service.activity.ActivityLaunchPhotoService;
import cn.com.zzzy.service.activity.ActivityLaunchService;
import cn.com.zzzy.service.activity.ActivityService;

@Controller
public class ActivityLaunchController {
        
        @Autowired
        private ActivityLaunchService activityLaunchService;
        
        @Autowired
        private ActivityLaunchPhotoService  activityLaunchPhotoService;
        
        @Autowired
        private ActivityService activityService;
        
        @RequestMapping("insertActivityLaunch")
        public  String   insertActivityLaunch(ActivityLaunch activityLaunch, String [] imgName,Integer activityId){
                activityLaunchService.insertlaunchActivity(activityLaunch);
                System.out.println("活动ID:"+activityId);
                //循环添加照片
                for(int i=0;i<imgName.length;i++){
                    ActivityLaunchPhoto activityLaunchPhoto = new ActivityLaunchPhoto();
                    System.out.println("第"+i+"张图片名称:"+imgName[i]);
                    activityLaunchPhoto.setActivityLaunchId(activityLaunch.getActivityLaunchId());
                    activityLaunchPhoto.setActivityLaunchPhotos(imgName[i]);
                    activityLaunchPhotoService.insertActivityLaunchPhoto(activityLaunchPhoto);
                }
                
               
                Activity activity = new Activity();
                activity.setActivityId(activityId);
                activity.setActivityFlag(3);
                activity.setActivityLaunchId(activityLaunch.getActivityLaunchId());
                //更新活动状态为已发起状态、
                activityService.updateActivityFlag(activity);
                activityService.updateActivityLaunchId(activity);
                return "/front/activity/activitydetail.jsp?activityId="+activityId;
        }
}
