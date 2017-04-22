package cn.com.zzzy.basemapper.communitymapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.com.zzzy.entity.Community;
import cn.com.zzzy.entity.CommunityVo;

public interface CommunityMapper {
    /**
     * 查询方法
     * 社团     
     * @return
     */
    public List<Community> select(@Param("comm") CommunityVo communityVo);
    /**
     * 根据Id查询出社团的详细信息
     * @param id
     * @return
     */
    public CommunityVo selectById(Integer id);
    /**
     * 添加社团
     */
    public void insert(CommunityVo communityVo);
    /**
     * 根据ID查询出自己的社团
     */
    public CommunityVo queryById(Integer id);
    
}
