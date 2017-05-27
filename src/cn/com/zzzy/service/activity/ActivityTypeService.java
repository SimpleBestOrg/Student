package cn.com.zzzy.service.activity;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.zzzy.basemapper.activitymapper.ActivityTypeMapper;
import cn.com.zzzy.entity.ActivityType;

@Service
public class ActivityTypeService {
        
        @Autowired
        private  ActivityTypeMapper activityTypeMapper;
        
        /**
         * 查找所有的活动类型
         * @return
         */
        public  List<ActivityType>   queryAllActivityType(Integer studentId){
            return   activityTypeMapper.queryAllActivityType(studentId);
        }
        
        
        /**
         * 添加活动类型(创建社团时  经过后台审核同意后 才可以添加活动类型)
         * @param acitvityType
         */
        public  void insertActivityType(ActivityType acitvityType){
                    activityTypeMapper.insertActivityType(acitvityType);
        }
        
}
