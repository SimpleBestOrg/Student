package cn.com.zzzy.controller.talking;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.com.zzzy.entity.AuthorityAccount;
import cn.com.zzzy.entity.Student;
import cn.com.zzzy.entity.StudentMessage;
import cn.com.zzzy.entity.Talking;
import cn.com.zzzy.entity.TalkingPhoto;
import cn.com.zzzy.entity.TalkingStudentThum;
import cn.com.zzzy.entity.TalkingToCao;
import cn.com.zzzy.service.TalkingService;
import cn.com.zzzy.service.TalkingStudentThumService;
import cn.com.zzzy.service.TalkingToCaoService;
import cn.com.zzzy.service.student.StudentMessageService;
import cn.com.zzzy.util.PageParam;
import cn.com.zzzy.util.Util;

@Controller
public class TalkingController {

    @Autowired
    private TalkingService talkingService;

    @Autowired
    private TalkingStudentThumService talkingStudentThumService;

    @Autowired
    private TalkingToCaoService talkingToCaoService;

    @Autowired
    private StudentMessageService studentMessageService;

    /**
     * 根据学生ID查询朋友的说说
     * @param param
     * @return
     */
    @RequestMapping("queryTalkingByFriendId")
    @ResponseBody
    public List<Talking> queryTalkingByFriendId(PageParam param,HttpServletRequest request) {
        // 得到登录学生的ID
        AuthorityAccount account =(AuthorityAccount)request.getSession().getAttribute("Account");
        System.out.println("学生号:"+account.getStudentId());
        List<Talking> talkingList = talkingService.queryTalkingByFriendId(param, account.getStudentId());
        return talkingList;
    }

    /**
     * 根据学生朋友ID查询朋友的说说数量
     * @return
     */
    @RequestMapping("queryTalkCountByFriId")
    public void queryTalkCountByFriId(HttpServletRequest request) {
        AuthorityAccount account =(AuthorityAccount)request.getSession().getAttribute("Account");
        int count = talkingService.queryTalkCountByFriId(account.getStudentId());
        System.out.println("好友説説數量:" + count);
    }

    /**
     * 根据学生ID查询自己的说说
     * @param param
     * @return
     */
    @RequestMapping("queryTalkingByStuId")
    @ResponseBody
    public List<Talking> queryTalkingByStuId(PageParam param,HttpSession session) {
        Integer stuId = (Integer)session.getAttribute("stuId");
        List<Talking> TalkingStuIdList = talkingService.queryTalkingByStuId(param, stuId);
        return TalkingStuIdList;
    }

    /**
     * 根据学生ID查询发表说说的数量
     * @return
     */
    @RequestMapping("queryTalkCountByStuId")
    public void queryTalkCountByStuId(HttpSession session) {
        Integer stuId = (Integer)session.getAttribute("stuId");
        int count = talkingService.queryTalkCountByStuId(stuId);
        System.out.println("学生编号1发表的说说数量:" + count);
    }

    /**
     * 根据说说ID查询说说的评论信息
     * @param talkingId
     * @return
     */
    @RequestMapping("queryTalkingToCaoList")
    @ResponseBody
    public List<TalkingToCao> queryTalkingToCaoList(Integer talkingId) {
        talkingId = 1;
        List<TalkingToCao> list = talkingToCaoService.queryTalkingToCaoList(talkingId);
        return list;
    }


    /**
     * 更新说说的赞
     * @param stuId
     * @param talkingId
     */
    @RequestMapping("thumTalking")
    @ResponseBody
    public String thumTalking(HttpSession session, Integer talkingId,Integer studentId) {
        Student loginStudent = (Student)session.getAttribute("loginStudent");
        TalkingStudentThum talkingStudentThum = new TalkingStudentThum();
        talkingStudentThum.setStudentId(loginStudent.getStudentId());
        talkingStudentThum.setTalkingId(talkingId);
        System.out.println("是否赞过 该说说:"+talkingStudentThumService.queryCount(talkingStudentThum));
        String msg = null;
        // 判断学生是否 赞过该说说
        if (studentId != loginStudent.getStudentId()  && talkingStudentThumService.queryCount(talkingStudentThum) == 0) {
            talkingService.updateTalkThum(talkingId);
            talkingStudentThumService.save(talkingStudentThum);
            //通知对方  赞了该说说
            StudentMessage studentMessage = new StudentMessage();
            studentMessage.setStudentId(studentId);
            String messageContext = "<a href='/Student/queryStudentInfoById.action?stuId="+loginStudent.getStudentId()+"'><cite></a>"+loginStudent.getStudentName()+"</cite>赞了您的说说";
            studentMessage.setMessageContext(messageContext);
            studentMessage.setStudentId(studentId);
            studentMessageService.insertMessage(studentMessage);
            msg = "成功点赞";
        } else if(studentId == loginStudent.getStudentId()  ){
            System.out.println("不能赞自己的说说");
            msg = "不能点赞自己的说说";
        } else if(studentId != loginStudent.getStudentId()  && talkingStudentThumService.queryCount(talkingStudentThum) == 1){
            System.out.println("已经攒过该说说");   
            msg  = "已经点赞";
        }
        return msg;
    }
    
    
    /**
     * 发表说说
     * @param talking
     * @param imgName
     * @return
     */
    @RequestMapping("insertTalking")
    public  String  insertTalking(Talking talking,String [] imgName,HttpServletRequest request){
        System.out.println("说说内容:"+talking.getTalkingContent());
        talking.setTalkingStudentId((Integer)request.getSession().getAttribute("stuId"));
        //保存说说
        talkingService.insertTalking(talking);
        
        System.out.println("说说ID:"+talking.getTalkingId());
        //实例化说说图片对象
        TalkingPhoto talkingPhoto = new TalkingPhoto();
        if(imgName.length>0){
            for(int i=0;i<imgName.length;i++){
                 System.out.println("下表:"+i+imgName[i]);
                 talkingPhoto.setTalkingPhoto(imgName[i]);
                 //设置说说的ID   添加说说成功后 返回说说的主键ID                                        
                 talkingPhoto.setTalkingId(talking.getTalkingId());
                 talkingService.insertTalkingPhoto(talkingPhoto);
            }
        }
        return "/front/talking/talkingindex.jsp";
    }
}