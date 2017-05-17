package cn.com.zzzy.service.activity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.zzzy.basemapper.activitymapper.ActivityLaunchPhotoMapper;
import cn.com.zzzy.entity.ActivityLaunchPhoto;

@Service
public class ActivityLaunchPhotoService {
        
        @Autowired
        private ActivityLaunchPhotoMapper activityLaunchPhotoMapper;
        
        /**
         * 添加活动宣传海报
         * @param activityLaunchPhoto
         */
        public void  insertActivityLaunchPhoto(ActivityLaunchPhoto activityLaunchPhoto){
            activityLaunchPhotoMapper.insertActivityLaunchPhoto(activityLaunchPhoto);
        }
}
