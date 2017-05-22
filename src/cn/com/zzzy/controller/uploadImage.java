package cn.com.zzzy.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.com.zzzy.entity.JsonInfo;


@Controller
public class uploadImage {
    
    @RequestMapping("uploadImage")
    @ResponseBody
    public   JsonInfo  uploadImage(MultipartFile file) throws IllegalStateException, IOException{
        System.out.println("原始："+file.getOriginalFilename());
        System.out.println("原始："+file.getInputStream());
        System.out.println("getName"+file.getName());
        System.out.println("原始名称:"+file.getOriginalFilename());
        String originalFilename  =   file.getOriginalFilename();
        String  newFileName = null;
        String newFileNames  = null;
        Integer count =  1;
        if(file!=null && originalFilename!=null && originalFilename.length()>0){
              // 存储图片的物理路径
            String  pic_path = "D:\\develop\\";
            //新的图片名称
            newFileName = UUID.randomUUID() + originalFilename.substring(originalFilename.lastIndexOf("."));
             newFileNames = newFileName.replaceAll("-", "_");
            //新图片
            File  files = new File(pic_path+newFileNames);
            //将内存的数据写入磁盘
            file.transferTo(files);
            count = 1;
        }
        
      return new JsonInfo(count,newFileNames);
    }
}
