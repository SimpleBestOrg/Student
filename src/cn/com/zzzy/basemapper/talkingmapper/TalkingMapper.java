package cn.com.zzzy.basemapper.talkingmapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.com.zzzy.basemapper.BaseMapper;
import cn.com.zzzy.entity.Student;
import cn.com.zzzy.entity.StudentFriend;
import cn.com.zzzy.entity.Talking;
import cn.com.zzzy.entity.TalkingPhoto;
import cn.com.zzzy.util.PageParam;

public interface TalkingMapper extends BaseMapper<Talking>{
     
    /**
     * 根据学生ID查询朋友的说说
     * @param param
     * @param stuId
     * @return
     */
    List<Talking>  queryTalkingByFriendId(@Param("page")PageParam param,@Param("stuId") Integer stuId);
    /**
     * 根据学生ID查询出朋友说说的数量
     * @param param
     * @param stuId
     * @return
     */
     int  queryTalkCountByFriId(@Param("stuId") Integer stuId);
    
    
    /**
     * 根据学生ID查询发表过的说说
     * @param param
     * @param stuId
     * @return
     */
    List<Talking>  queryTalkingByStuId(@Param("page") PageParam param,@Param("stuId") Integer stuId);
    
    /**
     * 根据学生ID查询发表过的说说的数量
     * @param param
     * @param stuId
     * @return
     */
    int  queryTalkCountByStuId(@Param("stuId") Integer stuId);
    
    /**
     * 更新说赞的次数
     * @param stuId
     * @param talkingId
     */
    void  updateTalkThum(Integer talkingId);
    
    /**
     * 发表说说
     * @param talking
     */
    Integer  insertTalking(Talking talking);
    
    /**
     * 添加说说图片
     * @param talkingPhoto
     */
    void  insertTalkingPhoto(TalkingPhoto talkingPhoto);
    
    /**
     * 根据说说ID  删除说说
     * @param talkingId
     */
    void  deleteTalkingByTalkingId(@Param("talkingId")Integer talkingId);
    
    /**
     * 根据说说ID 删除说说的照片
     * @param talkingId
     */
    void  deleteTalkingPhotoByTalkingId(@Param("talkingId")Integer talkingId);
}
