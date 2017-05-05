package cn.com.zzzy.controller.talking;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.zzzy.entity.TalkingToCao;
import cn.com.zzzy.service.TalkingToCaoService;

@Controller
public class talkingToCaoController {
        
    @Autowired
    private TalkingToCaoService talkingToCaoService;
    
    /**
     * 添加回复
     * @param talkingToCao
     * @return
     */
    @RequestMapping("insertTalkingToCao")
    @ResponseBody
    public String insertTalkingToCao(@RequestBody TalkingToCao talkingToCao){
          talkingToCao.setTalkingToCaoStudentID(1);
          return talkingToCaoService.insertTalkingToCao(talkingToCao);
    }
}
