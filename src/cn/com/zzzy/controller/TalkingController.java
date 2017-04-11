package cn.com.zzzy.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.zzzy.entity.Talking;
import cn.com.zzzy.service.TalkingService;
import cn.com.zzzy.util.PageParam;

@Controller
public class TalkingController {
        
    @Autowired
    private  TalkingService    talkingSerice;
    
    /**
     * 根據學生的朋友ID查詢朋友的説説
     * @param param
     * @return
     */
    @RequestMapping("queryTalkingByFriendId")
    @ResponseBody
    public  List<Talking> queryTalkingByFriendId(PageParam param){
         List<Integer> stuId = new ArrayList<Integer>();
         stuId.add(1);
         stuId.add(2);
         List<Talking> list = talkingSerice.queryTalkingByFriendId(param, stuId);
         return list;
    }
}