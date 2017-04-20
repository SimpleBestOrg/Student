package cn.com.zzzy.basemapper.talkingmapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.com.zzzy.basemapper.BaseMapper;
import cn.com.zzzy.entity.TalkingToCao;

public interface TalkingToCaoMapper  extends BaseMapper<TalkingToCao>{
    
      /**
       * 根据说说ID查询说说的评论信息
       * @param talkingToCaoId
       * @return
       */
      List<TalkingToCao>   queryTalkingToCaoList(@Param("talkingId") Integer talkingId);
      
}
