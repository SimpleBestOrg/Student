package cn.com.zzzy.service.activity;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.zzzy.basemapper.activitymapper.ActivityPhotoMapper;
import cn.com.zzzy.entity.ActivityPhoto;

@Service
public class ActivityPhotoService {

    @Autowired
    private ActivityPhotoMapper activityPhotoMapper;

    /**
     * 根据活动记录ID查询多张活动照片
     * @param recordId
     * @return
     */
    public List<ActivityPhoto> queryActivityPhotoList(Integer recordId) {
        if (recordId != null) {
            List<ActivityPhoto> activityPhotoList =  activityPhotoMapper.queryActivityPhotoList(recordId);
            System.out.println("活动照片:"+activityPhotoList.get(0).getActivityPhoto());
            return activityPhotoList;
        } else {
            return null;
        }
    }

}
