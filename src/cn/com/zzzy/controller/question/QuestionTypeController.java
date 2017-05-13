package cn.com.zzzy.controller.question;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.com.zzzy.entity.Question;
import cn.com.zzzy.entity.QuestionType;
import cn.com.zzzy.service.question.QuestionTypeService;

@Controller
public class QuestionTypeController {
	@Autowired
	private QuestionTypeService questionTypeService;
	/*
	 * 根据类型查询问题
	 */
	@RequestMapping("questiontypetitle")
	@ResponseBody
    public ModelAndView questiontypetitle(Integer tid){
        ModelAndView mv = new ModelAndView();
        List<QuestionType> list=  questionTypeService.selecall();
        List<Question> listt = questionTypeService.selecttype(1);
        mv.addObject("list",list);
		mv.addObject("listt",listt);
		System.out.println("根据ID查询问题出来没");
        System.out.println("查詢问题"+listt);
        System.out.println("查询类型"+list);
		mv.setViewName("fronttt/MyQuestion.jsp");
        return mv;
    }
}
