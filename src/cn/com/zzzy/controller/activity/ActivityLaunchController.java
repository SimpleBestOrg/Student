package cn.com.zzzy.controller.activity;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.com.zzzy.entity.Activity;
import cn.com.zzzy.entity.ActivityLaunch;
import cn.com.zzzy.entity.ActivityLaunchPhoto;
import cn.com.zzzy.entity.ActivityStudent;
import cn.com.zzzy.service.activity.ActivityLaunchPhotoService;
import cn.com.zzzy.service.activity.ActivityLaunchService;
import cn.com.zzzy.service.activity.ActivityService;
import cn.com.zzzy.service.activity.ActivityStudentService;

@Controller
public class ActivityLaunchController {
        
        @Autowired
        private ActivityLaunchService activityLaunchService;
        
        @Autowired
        private ActivityLaunchPhotoService  activityLaunchPhotoService;
        
        @Autowired
        private ActivityService activityService;
        
        @Autowired
        private ActivityStudentService activityStudentService;
        
        /**
         * 发起活动
         * @param activityLaunch
         * @param imgName  宣传海报
         * @param activityId  活动ID
         * @return
         */
        @RequestMapping("insertActivityLaunch")
        public  String   insertActivityLaunch(ActivityLaunch activityLaunch, String [] imgName,Integer activityId,HttpSession session){
                //添加活动发起的内容
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
                //更新活动状态为已发起状态
                activityService.updateActivityFlag(activity);
                //更新活动发起ID
                activityService.updateActivityLaunchId(activity);
                //如果将活动发起 那么将该学生添加到参加人员中
                ActivityStudent activityStudent = new ActivityStudent();
                activityStudent.setActivityId(activityId);
                System.out.println((Integer)session.getAttribute("stuId"));
                activityStudent.setStudentId((Integer)session.getAttribute("stuId"));
                activityStudent.setStuActivityFlag(1);
                activityStudentService.insertActivityStudent(activityStudent);
                return "/front/activity/activitydetail.jsp?activityId="+activityId;
        }
}
