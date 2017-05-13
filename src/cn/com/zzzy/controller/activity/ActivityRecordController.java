package cn.com.zzzy.controller.activity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.com.zzzy.entity.ActivityRecordPhoto;
import cn.com.zzzy.entity.ActivityRecord;
import cn.com.zzzy.service.activity.ActivityRecordPhotoService;
import cn.com.zzzy.service.activity.ActivityRecordService;

@Controller
public class ActivityRecordController {

    @Autowired    
    private  ActivityRecordService    activityRecordService;
        
    @Autowired
    private ActivityRecordPhotoService    activityRecordPhotoService;
    
    /**
     * 添加活动记录
     * @param activityRecord
     * @param imgName
     * @return
     */
    @RequestMapping("insertActivityRecord")
    public String  insertActivityRecord(ActivityRecord activityRecord,String imgName[]){
         System.out.println("活动记录内容:"+activityRecord.getActivityRecordContent());
         System.out.println("活动ID:"+activityRecord.getActivityId());
         activityRecordService.insertActivityRecord(activityRecord);
         for(int i=0;i<imgName.length;i++){
             ActivityRecordPhoto   activityPhoto = new ActivityRecordPhoto();
             activityPhoto.setActivityRecordId(activityRecord.getActivityRecordId());
             activityPhoto.setActivityRecordPhoto(imgName[i]);
             activityRecordPhotoService.insertActivityRecordPhoto(activityPhoto);
             System.out.println("照片名称:"+imgName[i]);
         }
         return "front/activity/activitydetail.jsp?activityId="+activityRecord.getActivityId();
    }
    
    
}
