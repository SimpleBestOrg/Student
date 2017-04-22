package cn.com.zzzy.service.community;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.zzzy.basemapper.communitymapper.CommunityMapper;
import cn.com.zzzy.entity.Community;
import cn.com.zzzy.entity.CommunityVo;

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
     * 根据ID查询
     * @param id
     * @return
     */
    public CommunityVo selectById(Integer id){
        return communityMapper.selectById(id);
    }
    /**
     * 添加社团
     */
    public void insert(CommunityVo communityVo){
        System.out.println("进来了！！！");
        communityMapper.insert(communityVo);
    }
    
}
