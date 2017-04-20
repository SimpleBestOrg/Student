package cn.com.zzzy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.zzzy.basemapper.talkingmapper.TalkingMapper;
import cn.com.zzzy.entity.StudentFriend;
import cn.com.zzzy.entity.Talking;
import cn.com.zzzy.util.PageParam;

@Service
public class TalkingService {
    
    @Autowired
    private   TalkingMapper talkingMapper;
   
    
    /**
     * 根据朋友ID分頁查詢朋友的説説
     * @param param
     * @param stuId
     * @return
     */
    public List<Talking> queryTalkingByFriendId(PageParam param,List<StudentFriend> friendInfo){
        List<Talking>  talkingList = talkingMapper.queryTalkingByFriendId(param, friendInfo);
        return talkingList;
    }
    
    /**
     * 根据朋友ID查询发表过的说说的数量
     * @param stuId
     * @return
     */
    public  int  queryTalkCountByFriId(List<Integer> stuId){
         return   talkingMapper.queryTalkCountByFriId(stuId);
    }
    
    /**
     * 根據學生ID查詢所有説説
     * @param param
     * @param stuId
     * @return
     */
    public List<Talking>  queryTalkingByStuId(PageParam param,Integer stuId){
        return   talkingMapper.queryTalkingByStuId(param, stuId);
    }
    
    /**
     * 根据学生ID查询学生说说的数量
     * @param stuId
     * @return
     */
    public  int queryTalkCountByStuId(Integer stuId){
          return  talkingMapper.queryTalkCountByStuId(stuId);
    }
    
    
    
    /**
     * 发表说说
     * @param talking
     */
    public void insertTalking(Talking talking){
        if(talking!=null  &&  talking.getTalkingStudentId()!=null  && talking.getTalkingContent()!=null && talking.getTalkingAuthorityId()!=null){
            talkingMapper.save(talking);
        }else{
            System.out.println("说说信息填写不完整");
        }
    }
    
    /**
     * 根据说说ID增加赞的次数
     * @param talkingId
     */
    public void  updateTalkThum(Integer talkingId){
        talkingMapper.updateTalkThum(talkingId);
    }
    
    
    
}
