package cn.com.zzzy.controller.activity;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.com.zzzy.service.activity.ActivityTypeService;

@Controller
public class ActivityTypeController {
      
      @Autowired  
      private ActivityTypeService activityTypeService;
        
      @RequestMapping("queryAllActivityType")
      public ModelAndView queryAllActivityType(HttpSession session){
          ModelAndView modelAndView = new ModelAndView();
          modelAndView.addObject("activiyType", activityTypeService.queryAllActivityType((Integer)session.getAttribute("stuId")));
          modelAndView.setViewName("/front/activity/addactivity.jsp");
          return  modelAndView;
      }  
}
