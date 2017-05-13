package cn.com.zzzy.basemapper.activitymapper;

import cn.com.zzzy.basemapper.BaseMapper;
import cn.com.zzzy.entity.ActivityStudent;

/**
 * 参加活动学生接口
 * @author Admin
 */
public interface ActivityStudentMapper  extends BaseMapper{
        /**
         * 添加活动学生
         * @param activityStudent
         */
        void insertActivityStudent(ActivityStudent activityStudent);
        
        
        /**
         * 更新学生加入活动的状态  同意或者拒绝
         * @param activityStudent
         */
        void updateStudentActivityFlag(ActivityStudent activityStudent);
}
