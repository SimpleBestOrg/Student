package cn.com.zzzy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.com.zzzy.basemapper.talkingmapper.TalkingMapper;
import cn.com.zzzy.entity.Student;
import cn.com.zzzy.entity.StudentFriend;
import cn.com.zzzy.entity.Talking;
import cn.com.zzzy.entity.TalkingPhoto;
import cn.com.zzzy.util.PageParam;

@Service
@Transactional
public class TalkingService {
    
    @Autowired
    private   TalkingMapper talkingMapper;
   
    
    /**
     * 根据朋友ID分頁查詢朋友的説説
     * @param param
     * @param stuId
     * @return
     */
    public List<Talking> queryTalkingByFriendId(PageParam param,Integer stuId){
        List<Talking>  talkingList = talkingMapper.queryTalkingByFriendId(param, stuId);
        return talkingList;
    }
    
    /**
     * 根据朋友ID查询发表过的说说的数量
     * @param stuId
     * @return
     */
    public  int  queryTalkCountByFriId(Integer stuId){
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
    public Integer insertTalking(Talking talking){
           return  talkingMapper.insertTalking(talking);
    }
    
    /**
     * 根据说说ID增加赞的次数
     * @param talkingId
     */
    public void  updateTalkThum(Integer talkingId){
        talkingMapper.updateTalkThum(talkingId);
    }
    
    /**
     * 添加说说图片
     * @param talkingPhoto
     */
    public void  insertTalkingPhoto(TalkingPhoto talkingPhoto){
         talkingMapper.insertTalkingPhoto(talkingPhoto);
    }
    
    /**
     * 根据说说ID删除说说
     * @param talkingId
     */
    public void  deleteTalkingByTalkingId(Integer talkingId){
         talkingMapper.deleteTalkingByTalkingId(talkingId);
    }
    
    /**
     * 根据说说ID删除说说的照片
     * @param talkingId
     */
    public void  deleteTalkingPhotoByTalkingId(Integer talkingId){
        talkingMapper.deleteTalkingPhotoByTalkingId(talkingId);
    }
    
    
    
}
