package cn.com.zzzy.service.community;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.zzzy.basemapper.communitymapper.CommunityMapper;
import cn.com.zzzy.entity.Community;
import cn.com.zzzy.entity.CommunityPeopleVo;
import cn.com.zzzy.entity.CommunityVo;
import cn.com.zzzy.entity.Student;
import cn.com.zzzy.util.PageData;
import cn.com.zzzy.util.PageParam;

@Service
public class CommunityService {
    @Autowired
    private CommunityMapper communityMapper;
    /**
     * 查询所有的内容
     * @param communityVo
     * @return
     */
    public List<Community> select(CommunityVo communityVo){
        return communityMapper.select(communityVo); 
    }
    /**
     * 根据社团ID查询详细信息
     * @param id
     * @return
     */
    public Community selectById(Integer id){
        return communityMapper.selectById(id);
    }
    /**
     * 添加社团
     */
    public void insert(CommunityVo communityVo){
        System.out.println("进来了！！！");
        communityMapper.insert(communityVo);
    }
    /**
     * 根据学生ID查询自己所在的社团
     */
    public Community queryById(Integer id){
        return communityMapper.queryById(id);
    }
    /**
     * 查询这个社团中的成员
     */
    public List<Student> MyCommunityInfo(CommunityVo communityVo){
        return communityMapper.MyCommunityInfo(communityVo);
    }
    /**
     * 登录者申请入团
     */
    public void insertAppli(CommunityPeopleVo communityPeopleVo){
        communityMapper.insertAppli(communityPeopleVo);
    }
    
    /**
     * 根据条件分页查询所有社团
     * @param param
     * @return
     */
    public List<Community>  queryAllCommunity(PageParam param){
        return communityMapper.queryAllCommunity(param);
    } 
    
    /**
     * 根据条件查询社团的数量
     * @param param
     * @return
     */
    public Integer  queryCountAllCommunity(PageParam param){
        return communityMapper.queryCountAllCommunity(param);
    }
    
    /**
     * 供后台分页使用
     * @param param
     * @return
     */
    public PageData queryCommunityForPage(PageParam param){
         return new PageData(queryCountAllCommunity(param),queryAllCommunity(param));
    }
    
    /**
     * 更新活动中状态
     * @param community
     */
    public void  updateCommunityFlag(Community community){
           communityMapper.updateCommunityFlag(community);
    }
}
