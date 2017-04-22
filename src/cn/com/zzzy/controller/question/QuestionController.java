package cn.com.zzzy.controller.question;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.com.zzzy.entity.Question;
import cn.com.zzzy.entity.QuestionType;
import cn.com.zzzy.entity.Student;
import cn.com.zzzy.service.question.QuestionAnswerService;
import cn.com.zzzy.service.question.QuestionService;
import cn.com.zzzy.service.question.QuestionTypeService;

@Controller
public class QuestionController {
	@Autowired
	private QuestionService questionService;
	@Autowired
	private QuestionTypeService questionTypeService;
	@Autowired
	private QuestionAnswerService questionAnswerService;
	
	
	@RequestMapping("studnetquestion")
	@ResponseBody
	public ModelAndView studnetquestion(){
		List list=questionService.stuqueryList(1);
		ModelAndView mv = new ModelAndView();
		mv.addObject("stulist",list);
		questionTypeService.selecall();
		questionTypeService.selecttype(1);
		//questionsel();
		mv.setViewName("fronttt/MyQuestion.jsp");
		return mv;
	}
	
	
	public ModelAndView questionsel(){
		List listAns=questionAnswerService.select(1);
		List liststu=questionService.selectname(1);
		ModelAndView mv = new ModelAndView();
		mv.addObject("listAns",listAns);
		mv.addObject("liststu",liststu);
		return mv;
	}
	
	@RequestMapping("questionselect")
	@ResponseBody
	public  List questionselect(Integer qid){
		List list=questionService.selectname(1);
		/*ModelAndView mv=new ModelAndView();
		mv.addObject("listselect",list);
		mv.setViewName("front/question/questiondetail.jsp");*/
		return list;
	}
	
	
	/**
	 * 查询全部问题
	 * @return
	 */
	@RequestMapping("squestion")
	@ResponseBody
	public ModelAndView squestion(){
		List<Question> quest= questionService.squestion();
		ModelAndView mv = new ModelAndView();
		mv.addObject("quest",quest);
		mv.setViewName("front/question/questionindex.jsp");
		return mv;
	}
	
	/**
	 * 查找我的问题
	 * @param sid
	 * @return
	 */
	@RequestMapping("stuquestion")
	@ResponseBody
	public ModelAndView stuquest(Integer sid){
		List stuquelist=questionService.stuqueryList(1);
		ModelAndView mv=new ModelAndView();
		//System.out.println(stuquelist.get(0));
		mv.addObject("stuquestion",stuquelist);
		mv.setViewName("front/question/Myquestionindex.jsp");
		return mv;
	}
	
	/**
	 * 添加问题  
	 * @param que
	 */
	@RequestMapping("add")
	@ResponseBody
	public void addque(Question que){
		Question ques=new Question();
		ques.setQuesetionContent("电脑卡顿，开机慢");
		ques.setQuesetionTitle("电脑常识");
		Student stu=new Student();
		stu.setStudentId(1);
		QuestionType qutype=new QuestionType();
		qutype.setQuesetionTypeId(1);
		ques.setQuesetionStudentId(stu);
		ques.setQuesetionTypeId(qutype);
		questionService.add(ques);
	}
	
}
