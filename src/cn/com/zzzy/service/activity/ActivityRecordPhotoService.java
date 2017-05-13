package cn.com.zzzy.service.activity;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.zzzy.basemapper.activitymapper.ActivityRecordPhotoMapper;
import cn.com.zzzy.entity.ActivityRecordPhoto;

@Service
public class ActivityRecordPhotoService {

    @Autowired
    private ActivityRecordPhotoMapper activityPhotoMapper;

    /**
     * 根据活动记录ID查询多张活动照片
     * @param recordId
     * @return
     */
    public List<ActivityRecordPhoto> queryActivityPhotoList(Integer recordId) {
        if (recordId != null) {
            List<ActivityRecordPhoto> activityPhotoList =  activityPhotoMapper.queryActivityPhotoList(recordId);
            System.out.println("活动照片:"+activityPhotoList.get(0).getActivityRecordPhoto());
            return activityPhotoList;
        } else {
            return null;
        }
    }
    
    /**
     * 添加活动照片
     * @param activitPhoto
     */
    public  void   insertActivityRecordPhoto(ActivityRecordPhoto activitPhoto){
        activityPhotoMapper.insertActivityRecordPhoto(activitPhoto);
    }
    
    
}
