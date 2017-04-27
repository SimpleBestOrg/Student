package cn.com.zzzy.controller.student;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.zzzy.entity.StudentClasses;
import cn.com.zzzy.service.student.StudentClassesService;

@Controller
public class StudentClassController {
        @Autowired    
        private  StudentClassesService  studentClassService;
        
        /**
         * 查找所有班级
         */
        @RequestMapping("queryAllClasses")
        @ResponseBody
        public List<StudentClasses>  queryAllClasses(){
            return  studentClassService.queryAllClasses();
        }
            
}
