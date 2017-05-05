package cn.com.zzzy.basemapper.communitymapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.com.zzzy.entity.Community;
import cn.com.zzzy.entity.CommunityPeopleVo;
import cn.com.zzzy.entity.CommunityVo;
import cn.com.zzzy.entity.Student;
import cn.com.zzzy.util.PageParam;

public interface CommunityMapper {
    /**
     * 查询所有已经被批准的的社团
     * @return
     */
    public List<Community> select(@Param("comm") CommunityVo communityVo);
    /**
     * 根据Id查询出社团的详细信息
     * @param id
     * @return
     */
    public Community selectById(Integer id);
    /**
     * 申请建立社团
     */
    public void insert(CommunityVo communityVo);
    /**
     * 根据登陆者查询出自己的社团的详细信息
     */
    public Community  queryById(Integer id);
    
    /**
     * 查询登陆者所在的社团成员
     */
    public List<Student> MyCommunityInfo(CommunityVo communityVo);
    /**
     * 申请入团
     * 
     */
    public void insertAppli(CommunityPeopleVo communityPeopleVo);
    
    /**
     * 分页查询所有的社团
     * @param param
     * @return
     */
    List<Community>  queryAllCommunity(@Param("param")PageParam param);
    
    /**
     * 根据条件(条件封装在PageParam里面) 查询所有社团的数量
     * @param param
     * @return
     */
    Integer  queryCountAllCommunity(@Param("param") PageParam param);
    
    /**
     * 更新活动状态
     * @param community
     */
    void updateCommunityFlag(@Param("param") Community community);
}
