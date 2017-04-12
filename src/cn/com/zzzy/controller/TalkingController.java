package cn.com.zzzy.controller;

import java.util.ArrayList;
import java.util.List;

import org.aspectj.internal.lang.annotation.ajcDeclareAnnotation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.zzzy.entity.Student;
import cn.com.zzzy.entity.Talking;
import cn.com.zzzy.entity.TalkingStudentThum;
import cn.com.zzzy.entity.TalkingToCao;
import cn.com.zzzy.service.TalkingService;
import cn.com.zzzy.service.TalkingStudentThumService;
import cn.com.zzzy.service.TalkingToCaoService;
import cn.com.zzzy.util.PageParam;

@Controller
public class TalkingController {
        
    @Autowired
    private  TalkingService    talkingService;
    
    @Autowired
    private  TalkingStudentThumService  talkingStudentThumService;
   
    @Autowired
    private  TalkingToCaoService talkingToCaoService;
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
         List<Talking> list = talkingService.queryTalkingByFriendId(param, stuId);
         return list;
    }
   
    /**
     * 根据学生朋友ID查询朋友的说说数量
     * @return
     */
    @RequestMapping("queryTalkCountByFriId")
    public  void   queryTalkCountByFriId(){
          List<Integer>  stuId = new ArrayList<Integer>();
          stuId.add(1);
          stuId.add(2);
          int count =  talkingService.queryTalkCountByFriId(stuId);
          System.out.println("好友説説數量:"+count);
    }
    
    /**
     * 根据学生ID查询自己的说说
     * @param param
     * @return
     */
    @RequestMapping("queryTalkingByStuId")
    @ResponseBody
    public List<Talking>  queryTalkingByStuId(PageParam param){
       Integer stuId =  1;
       List<Talking>  TalkingStuIdList = talkingService.queryTalkingByStuId(param, stuId);
       return  TalkingStuIdList;
    }
    
    /**
     * 根据学生ID查询学生发表说说的数量
     * @return
     */
    @RequestMapping("queryTalkCountByStuId")
    public void  queryTalkCountByStuId(){
        int  stuId = 1;
        int count =  talkingService.queryTalkCountByStuId(stuId);
        System.out.println("学生编号1发表的说说数量:"+count);
    }
    
    /**
     * 根据说说ID查询说说的评论信息
     * @param talkingId
     * @return
     */
    @RequestMapping("queryTalkingToCaoList")
    @ResponseBody
    public List<TalkingToCao>  queryTalkingToCaoList(Integer talkingId){
           talkingId= 1;
          List<TalkingToCao>  list =   talkingToCaoService.queryTalkingToCaoList(talkingId);
            return  list;
    }
    
    /**
     * 发表说说
     * @param talking
     */
    @RequestMapping("insertTalking")
    public void  insertTalking(Talking talking){
        talking.setTalkingStudentId(3);
        talking.setTalkingContent("乐观  积极 向上  正确的价值观");
        talking.setTalkingAuthorityId(2);
        talkingService.insertTalking(talking);
    }
    
    /**
     * 更新说说的赞
     * @param stuId
     * @param talkingId
     */
    @RequestMapping("thumTalking")
    public void  thumTalking(Integer stuId,Integer talkingId){
        TalkingStudentThum talkingStudentThum = new TalkingStudentThum();
        talkingStudentThum.setStudentId(stuId);
        talkingStudentThum.setStudentId(talkingId);
        //判断学生是否 赞过该说说
        if(talkingStudentThumService.queryCount(talkingStudentThum)==0){
            talkingService.updateTalkThum(talkingId);
            talkingStudentThumService.save(talkingStudentThum);
        }else{
            System.out.println("已经赞过该说说");
        }
    }
}