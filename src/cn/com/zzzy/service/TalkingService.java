package cn.com.zzzy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.zzzy.basemapper.talkingmapper.TalkingMapper;
import cn.com.zzzy.entity.Talking;
import cn.com.zzzy.util.PageParam;

@Service
public class TalkingService {
    
    @Autowired
    private   TalkingMapper talkingMapper;
   
    
    /**
     * 根据朋友ID分頁查詢朋友的説説
     * @param param
     * @param stuId
     * @return
     */
    public List<Talking> queryTalkingByFriendId(PageParam param,List<Integer> stuId){
        List<Talking>  talkingList = talkingMapper.queryTalkingByFriendId(param, stuId);
        return talkingList;
    }
}
