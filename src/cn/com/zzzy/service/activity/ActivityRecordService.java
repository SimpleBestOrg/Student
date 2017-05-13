package cn.com.zzzy.service.activity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.zzzy.basemapper.activitymapper.ActivityRecordMapper;
import cn.com.zzzy.entity.ActivityRecord;

@Service
public class ActivityRecordService {
    
    @Autowired
    public ActivityRecordMapper  activityRecordMapper;
        
    
    /**
     * 添加活动记录
     * @param activityRecord
     */
    public void  insertActivityRecord(ActivityRecord  activityRecord){
              activityRecordMapper.insertActivityRecord(activityRecord);
    }
    
}
