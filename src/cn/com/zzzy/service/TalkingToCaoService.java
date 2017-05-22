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
         * 根据说说ID查询所有说说的评论
         * @param talkingToCaoId
         * @return
         */
        public  List<TalkingToCao>  queryTalkingToCaoList(Integer talkingId){
             return talkingToCaoMapper.queryTalkingToCaoList(talkingId);
        }
        
        /**
         * 添加回复
         * @param talkingToCao
         */
        public String  insertTalkingToCao(TalkingToCao talkingToCao){
            String msg = "回复失败";
            try {
                talkingToCaoMapper.insertTalkingToCao(talkingToCao);
                msg = "回复成功";
            } catch (Exception e) {
                 msg = "回复失败";
            }
            return msg;
        }
        
        /**
         * 根据说说ID删除说说的评论
         * @param talkingId
         */
        public void  delTalkTuCaoByTalkingId(Integer  talkingId){
             talkingToCaoMapper.delTalkTuCaoByTalkingId(talkingId);
        }
        
        
}
