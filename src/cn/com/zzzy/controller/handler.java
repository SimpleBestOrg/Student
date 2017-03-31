package cn.com.zzzy.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import cn.com.zzzy.entity.Activity;
import cn.com.zzzy.entity.ActivityPhoto;
import cn.com.zzzy.service.ServiceImpl;


/**
 * 测试之后 可以删除
 * @author Admin
 *
 */
@Controller
public class handler {
	
	@Autowired
	private  ServiceImpl ServiceImpl;
	
	
	@RequestMapping("insertPhoto.action")
	public String insertPhoto(MultipartFile items) throws IllegalStateException, IOException {
	    //获取原始图片名称
        String  originalFileName = items.getOriginalFilename();
        ActivityPhoto ap = new ActivityPhoto();
        //上传图片
        if(items != null && originalFileName != null && originalFileName.length() > 0){
            
            //存储图片的物理路径
            String pic_path = "E:\\develop\\";
            //图片的新名称
            String newFileName = UUID.randomUUID() + originalFileName.substring(originalFileName.lastIndexOf("."));
            
            //新图片
            File newFile = new File(pic_path+newFileName);
            
            //将内存中的数据写入磁盘中
            items.transferTo(newFile);
            
            ap.setActivityPhoto(newFileName);
            ap.setActivityRecordId(1);
            ap.setActivityPhotoId(1);
            ServiceImpl.insertPhoto(ap);
        }
        
		return "front/boostrap.jsp";
	}
	
	@RequestMapping("query1.action")
	public ModelAndView query1(){
		ModelAndView view = new ModelAndView();
		view.addObject("fdsa","fdsa");
		view.setViewName("/front/view.jsp");
		return view;
	}
	
	@RequestMapping("queryJson")
	@ResponseBody
	public  Activity  queryJson(@RequestBody Activity ac){
	    System.out.println("进入controller里面了");
	    return ac;
	}
	@RequestMapping("responseJson")
	@ResponseBody
	public Activity responseJson(Activity ac){
	    return ac;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
