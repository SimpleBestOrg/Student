package cn.com.zzzy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.zzzy.basemapper.talkingmapper.TalkingStudentThumMapper;
import cn.com.zzzy.entity.TalkingStudentThum;

@Service
public class TalkingStudentThumService {
      
        @Autowired
        private  TalkingStudentThumMapper talkingStudentThumMapper;
        
        
        /**
         * 当学生点击赞的时候 把学生ID 和 被赞的说说ID增加进来
         * @param talkingStudentThum
         */
        public void save(TalkingStudentThum  talkingStudentThum){
            talkingStudentThumMapper.saveTalkingStudent(talkingStudentThum);
        }
        
        /**
         * 查询是否赞过 说说
         * @param talkingStudentThum
         * @return
         */
        public int queryCount(TalkingStudentThum talkingStudentThum){
            System.out.println("赞说说的学生ID:"+talkingStudentThum.getStudentId());
            System.out.println("赞学生说说的说说ID:"+talkingStudentThum.getTalkingId());
            System.out.println(talkingStudentThum!=null);
            return  talkingStudentThumMapper.queryStudentCount(talkingStudentThum); 
        }
        
}
