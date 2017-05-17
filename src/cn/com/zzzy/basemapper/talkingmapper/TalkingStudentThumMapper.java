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
         
         void saveTalkingStudent(@Param("obj") TalkingStudentThum talkingStudentThum);
         
}
