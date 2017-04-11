package cn.com.zzzy.basemapper.talkingmapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.com.zzzy.basemapper.BaseMapper;
import cn.com.zzzy.entity.Talking;
import cn.com.zzzy.util.PageParam;

public interface TalkingMapper extends BaseMapper<Talking>{
     //查询朋友所有的说说
    List<Talking>  queryTalkingByFriendId(@Param("page")PageParam param,@Param("friendId") List<Integer> stuId);
    
}
