package cn.com.zzzy.basemapper.studentmapper;

import java.util.List;

import cn.com.zzzy.entity.StudentMessage;

public interface StudentMessageMapper {
    
        /**
         * 查询所有的消息
         * @return
         */
        List<StudentMessage>  queryAllMessage(Integer stuId);
        
        /**
         * 插入学生信息表
         * @param studentMessage
         */
        void insertMessage(StudentMessage studentMessage);
}
