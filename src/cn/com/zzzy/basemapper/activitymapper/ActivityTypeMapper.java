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
}
