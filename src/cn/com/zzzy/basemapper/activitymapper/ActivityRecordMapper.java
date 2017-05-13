package cn.com.zzzy.basemapper.activitymapper;

import cn.com.zzzy.entity.ActivityRecord;

public interface ActivityRecordMapper {
        
    /**
     * 添加活动记录
     * @param activityRecord
     */
    void  insertActivityRecord(ActivityRecord activityRecord);
}
