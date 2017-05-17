package cn.com.zzzy.basemapper.activitymapper;

import cn.com.zzzy.entity.ActivityLaunchPhoto;

public interface ActivityLaunchPhotoMapper {
    
        /**
         * 添加活动宣传海报(发起活动时添加)
         * @param activityLaunchPhoto
         */
        void insertActivityLaunchPhoto(ActivityLaunchPhoto activityLaunchPhoto);
        
}
