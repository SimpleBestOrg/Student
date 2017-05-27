package cn.com.zzzy.basemapper.activitymapper;

import java.util.List;

import cn.com.zzzy.basemapper.BaseMapper;
import cn.com.zzzy.entity.ActivityType;


/**
 * 活动类型接口
 * @author Admin
 *
 */
public interface ActivityTypeMapper {
        
    
    /**
     * 查找所有的活动类型
     * @return
     */
    List<ActivityType>  queryAllActivityType(Integer studentId);
    
    /**
     * 添加活动类型(创建社团时  经过后台审核同意后 才可以添加活动类型)
     * @param activityType
     */
    void    insertActivityType(ActivityType activityType);
}
