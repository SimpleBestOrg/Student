package cn.com.zzzy.basemapper.talkingmapper;

import org.apache.ibatis.annotations.Param;

import cn.com.zzzy.entity.TalkingStudentThum;

public interface TalkingStudentThumMapper {
       
        /**
         * 查询赞的学生是否赞过该说说
         * @param talkingStudent
         * @return
         */
         Integer  queryStudentCount(@Param("obj") TalkingStudentThum talkingStudentThum);
         
         /**
          * 学生赞了说说时 录入数据库 该学生的ID和说说ID 用于该学生是否赞过某个说说
          * @param talkingStudentThum
          */
         void saveTalkingStudent(@Param("obj") TalkingStudentThum talkingStudentThum);
         
         /**
          * 根据说说ID删除赞过该说说的人
          * @param talkingId
          */
         void  deleteTalkingThumStu(Integer talkingId);
}
