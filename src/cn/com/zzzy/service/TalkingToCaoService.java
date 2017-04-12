package cn.com.zzzy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.zzzy.basemapper.talkingmapper.TalkingToCaoMapper;
import cn.com.zzzy.entity.TalkingToCao;

@Service
public class TalkingToCaoService {
        @Autowired
        private  TalkingToCaoMapper  talkingToCaoMapper;
        
        /**
         * 根据说说ID查询所有的说说
         * @param talkingToCaoId
         * @return
         */
        public  List<TalkingToCao>  queryTalkingToCaoList(Integer talkingId){
             return talkingToCaoMapper.queryTalkingToCaoList(talkingId);
        }

      
        
}
