package cn.com.zzzy.basemapper.talkingmapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.com.zzzy.basemapper.BaseMapper;
import cn.com.zzzy.entity.Talking;
import cn.com.zzzy.util.PageParam;

public interface TalkingMapper extends BaseMapper<Talking>{
     
    /**
     * 根据学生ID查询朋友的说说
     * @param param
     * @param stuId
     * @return
     */
    List<Talking>  queryTalkingByFriendId(@Param("page")PageParam param,@Param("friendId") List<Integer> stuId);
    /**
     * 根据学生ID查询出朋友说说的数量
     * @param param
     * @param stuId
     * @return
     */
     int  queryTalkCountByFriId(@Param("friendId") List<Integer> stuId);
    
    
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
    
    
}
