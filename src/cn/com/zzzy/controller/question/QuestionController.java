package cn.com.zzzy.controller.question;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import cn.com.zzzy.entity.Question;
import cn.com.zzzy.entity.QuestionAnswer;
import cn.com.zzzy.entity.QuestionTuCao;
import cn.com.zzzy.entity.QuestionType;
import cn.com.zzzy.service.question.QuestionAnswerService;
import cn.com.zzzy.service.question.QuestionService;
import cn.com.zzzy.service.question.QuestionTuCaoService;
import cn.com.zzzy.service.question.QuestionTypeService;
import cn.com.zzzy.util.Util;

@Controller
public class QuestionController {
	@Autowired
	private QuestionService questionService;
	@Autowired
	private QuestionTypeService questionTypeService;
	@Autowired
	private QuestionTuCaoService questionTuCaoService;
	@Autowired
	private QuestionAnswerService questionAnswerService;
	/**
	 * 查询问题的详细信息
	 * @param qid
	 * @return
	 */
	@RequestMapping("questionselect")
	/*@ResponseBody*/
	public ModelAndView questionselect(Integer qid){
		System.out.println("得到问题的ID="+qid);
		//查询问题详情
		Question  question = questionService.selectname(qid);
		//获取赞最多的赞(热帖)
		List<Question> groupquestion=questionService.groupquestion();
		//查询(回复多的)热议
		List<Question> comment=questionService.commentselect();
		ModelAndView mv=new ModelAndView();
		mv.addObject("question", question);
		mv.addObject("groupquestion", groupquestion);
		mv.addObject("comment",comment);
		mv.addObject("qid", qid);
		mv.setViewName("front/question/questiondetail.jsp");
		return  mv;
	}
	
	/**
	 * 查询所有类别
	 * 添加预处理
	 * @return
	 */
	@RequestMapping("selecall")
	public ModelAndView selecall(){
		List<QuestionType> questiontype=questionTypeService.selecall();
		ModelAndView mv=new ModelAndView();
		mv.addObject("questiontype", questiontype);
		mv.setViewName("front/question/addquestion.jsp");
		return mv;
	}
	/**
	 * 查询全部问题
	 * @return
	 */
	@RequestMapping("squestion")
	public ModelAndView squestion(){
		List<Question> quest= questionService.squestion();
		List<QuestionType> questiontype=questionTypeService.selecall();
		ModelAndView mv = new ModelAndView();
		mv.addObject("quest",quest);
		mv.addObject("questiontype", questiontype);
		mv.setViewName("front/question/questionindex.jsp");
		return mv;
	}
	
	/**
	 * 我提问的问题
	 * @param sid
	 * @return
	 * 
	 */
	@RequestMapping("stuquestion")
	public ModelAndView stuquest(Integer sid){
		List<Question> stuquelist=questionService.stuqueryList(1);
		List<QuestionType> questiontype=questionTypeService.selecall();
		ModelAndView mv=new ModelAndView();
		mv.addObject("stuquestion",stuquelist);
		mv.addObject("questiontype",questiontype);
		mv.setViewName("front/question/Myquestionindex.jsp");
		return mv;
	}
	/**
	 * 根据问题类型ID查询问题
	 * @return
	 */
	@RequestMapping("typeQuestion")
	public ModelAndView typeQuestion(Integer typeId){
		List<QuestionType> questiontype=questionTypeService.selecall();
		List<Question> questionlist=questionService.typeQuestion(typeId);
		System.out.println("得到类型的ID="+typeId);
		ModelAndView mv=new ModelAndView();
		mv.addObject("questiontype",questiontype);
		mv.addObject("questionlist", questionlist);
		mv.addObject("typeId", typeId);
		mv.setViewName("front/question/questionTypeindex.jsp");
		return mv;
	}
	/**
	 * 更新 点赞
	 * 没有返回值
	 * @param step
	 * @param questionId
	 * @return
	 */
	@RequestMapping("updateStep")
	@ResponseBody
	public String  updateStep(Integer questionId,HttpSession session){
		questionTuCaoService.select(questionId);
		QuestionTuCao questionTuCao = new QuestionTuCao();
		questionTuCao.setQuestionId(questionId);
		questionTuCao.setQuestionToCaoStuId(1);
		System.out.println("打印了吗"+questionTuCaoService.queryTuCaoStudent(questionTuCao));
		String msg = null;
		if(questionTuCaoService.queryTuCaoStudent(questionTuCao)!=0){
			//向外打印   已经点过赞 不能再点赞
		    msg = "已点赞";
		    System.out.println(msg);
		}else if(questionTuCaoService.queryTuCaoStudent(questionTuCao)==0){
			System.out.println("看看打印的实际"+questionTuCaoService.queryTuCaoStudent(questionTuCao));
			//更新赞的次数
			questionService.updateStep(questionId);
			//插入吐槽桥梁表
			questionTuCaoService.insertTucao(questionTuCao);
		}
		return msg;
	}
	
	/**
	 * 模糊查询
	 * @param contenTitle
	 * @return
	 */
	@RequestMapping("questiondim")
	public ModelAndView questiondim(String contenTitle){
		List<Question> likedim=questionService.questiondim(contenTitle);
		List<QuestionType> questiontype=questionTypeService.selecall();
		ModelAndView mv=new ModelAndView();
		mv.addObject("likedim", likedim);
		mv.addObject("questiontype", questiontype);
		mv.setViewName("front/question/questionDim.jsp");
		return mv;
	}
	/**
	 * @param que
	 * 增加问题
	 */
	@RequestMapping("insertQuestion")
	public String insertQuestion(Question que){
		//添加学生编号
		que.setStudentId(1);
		questionService.insertQuestion(que);
		return "redirect:squestion.action";
	}
	/**
	 * 添加问题回复
	 * @param answer
	 * @return
	 */
	@RequestMapping("insertanswer")
	public String insertanswer(QuestionAnswer answer){
		answer.setAnswerStudentId(1);
		questionAnswerService.insertanswer(answer);
		System.out.println("得到问题ID"+answer.getAnswerQuestionId());
		Integer qid=answer.getAnswerQuestionId();
		return "redirect:questionselect.action?qid="+qid;
	}
}