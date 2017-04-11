package cn.com.zzzy.basemapper.activitymapper;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.com.zzzy.basemapper.BaseMapper;
import cn.com.zzzy.entity.Activity;
import cn.com.zzzy.entity.ActivityInfo;
import cn.com.zzzy.entity.ActivityQueryVo;
import cn.com.zzzy.util.PageParam;

/**
 * 活动mapper
 * @author  Admin
 *
 */

public interface ActivityMapper extends BaseMapper<Activity> {
    
    /**
     * 申请活动
     * @param activity
     */
    void insertActivity(@Param("obj") ActivityQueryVo activityQueryVo);
    
    /**
     * 通过活动ID查询活动详细信息
     * @param activityId  活动ID
     * @return  返回查询的活动
     */
    Activity queryActivityDetail(@Param("activityId") Integer activityId);
    
    /**
     *  根据ID查询参加过的活动
     * @return
     */
    List<Activity>   queryMyJoinActivity(@Param("param")  PageParam param,@Param("stuId")Integer stuId);
    
    
    /**
     * 通过条件分页查询所有的活动 
     * @param activityQueryVo   被包装的活动
     * @return
     */
    List<Activity> queryActivityByCondition(@Param("param") PageParam param,@Param("aqv") ActivityQueryVo activityQueryVo);
    
    /**
     * 根据条件查询活动的数量
     * @param activityQueryVo
     * @return
     */
    int queryActivityAcountByCondition(@Param("aqv") ActivityQueryVo activityQueryVo);
     
    
    /**
     * 分页条件查询所有的朋友说说
     * @param param
     * @param friendId
     * @return
     */
    List<Activity> queryActivityByFriendIds(@Param("param") PageParam param,@Param("aqv") List<Integer> friendId);
   /**
    * 查看朋友说说的数量 
    * @param friendId
    * @return
    */
    int queryActivityCountByFriendIds(@Param("aqv") List<Integer> friendId);
}
