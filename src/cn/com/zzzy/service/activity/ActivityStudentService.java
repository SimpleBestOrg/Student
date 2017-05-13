package cn.com.zzzy.service.activity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.zzzy.basemapper.activitymapper.ActivityStudentMapper;
import cn.com.zzzy.entity.ActivityStudent;

@Service
public class ActivityStudentService {
           @Autowired
           private ActivityStudentMapper activityStudentMapper;
           
           
           /**
            * 学生申请加入活动
            * @param activityStudent(活动ID,申请加入活动的学生ID,状态0)
            */
           public void insertActivityStudent(ActivityStudent activityStudent){
                 activityStudentMapper.insertActivityStudent(activityStudent);
           }
           
           /**
            * 更新学生加入活动的状态
            * @param activityStudent
            */
           public void updateStudentActivityFlag(ActivityStudent activityStudent){
                activityStudentMapper.updateStudentActivityFlag(activityStudent);
           }
           
}
