package cn.com.zzzy.controller.talking;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import cn.com.zzzy.entity.AuthorityAccount;
import cn.com.zzzy.entity.Talking;
import cn.com.zzzy.entity.TalkingPhoto;
import cn.com.zzzy.entity.TalkingStudentThum;
import cn.com.zzzy.entity.TalkingToCao;
import cn.com.zzzy.service.TalkingService;
import cn.com.zzzy.service.TalkingStudentThumService;
import cn.com.zzzy.service.TalkingToCaoService;
import cn.com.zzzy.util.PageParam;

@Controller
public class TalkingController {

    @Autowired
    private TalkingService talkingService;

    @Autowired
    private TalkingStudentThumService talkingStudentThumService;

    @Autowired
    private TalkingToCaoService talkingToCaoService;


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
    public List<Talking> queryTalkingByStuId(PageParam param) {
        Integer stuId = 3;
        List<Talking> TalkingStuIdList = talkingService.queryTalkingByStuId(param, stuId);
        return TalkingStuIdList;
    }

    /**
     * 根据学生ID查询发表说说的数量
     * @return
     */
    @RequestMapping("queryTalkCountByStuId")
    public void queryTalkCountByStuId() {
        int stuId = 3;
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
    public void thumTalking(Integer stuId, Integer talkingId) {
        TalkingStudentThum talkingStudentThum = new TalkingStudentThum();
        talkingStudentThum.setStudentId(stuId);
        talkingStudentThum.setStudentId(talkingId);
        // 判断学生是否 赞过该说说
        if (talkingStudentThumService.queryCount(talkingStudentThum) == 0) {
            talkingService.updateTalkThum(talkingId);
            talkingStudentThumService.save(talkingStudentThum);
        } else {
            System.out.println("已经赞过该说说");
        }
    }
    
    @RequestMapping("uploadImage")
    @ResponseBody
    public   void  uploadImage(@RequestParam("fileName") MultipartFile file) throws IllegalStateException, IOException{
//        System.out.println("原始："+pinfo.getInputStream());
//        System.out.println("getName"+pinfo.getName());
//        System.out.println("原始名称:"+pinfo.getOriginalFilename());
        //得到图片的原始名称
        String originalFilename  =   file.getOriginalFilename();
        System.out.println("图片"+originalFilename);
 //       String  newFileName = null;
//         Integer count =  1;
 //       if(pinfo!=null && originalFilename!=null && originalFilename.length()>0){
               //存储图片的物理路径
//             String  pic_path = "E:\\develop\\";
            //新的图片名称
//               newFileName = UUID.randomUUID() + originalFilename.substring(originalFilename.lastIndexOf("."));
//            //新图片
//            File  file = new File(pic_path+newFileName);
//            //将内存的数据写入磁盘
//            pinfo.transferTo(file);
//            newDetail.setPhoto(newFileName);
//            count = 1;
//        }
        
     //   return new jsonInfo(count,originalFilename);
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