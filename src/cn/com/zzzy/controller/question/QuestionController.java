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
import cn.com.zzzy.entity.Student;
import cn.com.zzzy.entity.StudentMessage;
import cn.com.zzzy.service.question.QuestionAnswerService;
import cn.com.zzzy.service.question.QuestionService;
import cn.com.zzzy.service.question.QuestionTuCaoService;
import cn.com.zzzy.service.question.QuestionTypeService;
import cn.com.zzzy.service.student.StudentMessageService;

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
	@Autowired
	private StudentMessageService studentMessageService;
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
		//回答问题最多的学生(回答榜)
		List<QuestionAnswer> answerlist=questionAnswerService.answerselect();
		//获取赞最多的赞(热帖)
		List<Question> groupquestion=questionService.groupquestion();
		//查询(回复多的)热议
		List<Question> comment=questionService.commentselect();
		//实例化ModelAndView
		ModelAndView mv=new ModelAndView();
		mv.addObject("answerlist", answerlist);
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
		//读取全部类型
		List<QuestionType> questiontype=questionTypeService.selecall();
		//实例化ModelAndView
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
	public ModelAndView squestion(Integer typeid,String content){
		//调用全部问题查询的service
		List<Question> quest= questionService.squestion(typeid,content);
		//调用查询全部类型
		List<QuestionType> questiontype = questionTypeService.selecall();
		//实例化ModelAndView
		ModelAndView mv = new ModelAndView();
		mv.addObject("quest",quest);
		mv.addObject("questiontype", questiontype);
		mv.addObject("typeId",typeid);
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
	public ModelAndView stuquest(HttpSession session,Integer typeid,String content){
		//调用我的问题查询的service
		List<Question> stuquelist=questionService.stuqueryList((Integer)session.getAttribute("stuId"),typeid,content);
		//调用查询全部类型
		List<QuestionType> questiontype=questionTypeService.selecall();
		//实例化ModelAndView
		ModelAndView mv=new ModelAndView();
		mv.addObject("stuquestion",stuquelist);
		mv.addObject("questiontype",questiontype);
		mv.addObject("typeId", typeid);
		mv.setViewName("front/question/Myquestionindex.jsp");
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
	public String  updateStep(Integer questionId,Integer studentId,HttpSession session){
		//实例化对象
		QuestionTuCao questionTuCao = new QuestionTuCao();
		//录入得到的问题Id
		questionTuCao.setQuestionId(questionId);
		//录入是谁吐槽的(只能是登陆的学生)
		questionTuCao.setQuestionToCaoStuId((Integer)session.getAttribute("stuId"));
		//判断吐槽表有无点赞记录  0是无记录(可以点赞 )
		if(questionTuCaoService.queryTuCaoStudent(questionTuCao)!=0){
			return "havaStep";
		}else {
			System.out.println("看看打印的实际"+questionTuCaoService.queryTuCaoStudent(questionTuCao));
			//更新赞的次数
			questionService.updateStep(questionId);
			//插入吐槽桥梁表
			questionTuCaoService.insertTucao(questionTuCao);
			//得到登陆学生的信息
			 Student  loginStudent = (Student)session.getAttribute("loginStudent");
			//如果是自己点赞自己的问题 那么 不用消息通知
			if(loginStudent.getStudentId() != studentId){
    			//如果点赞  给对方一个消息
    			StudentMessage studentMessage = new StudentMessage();
    			String messageContext = "<a href='/Student/queryStudentInfoById.action?stuId="+loginStudent.getStudentId()+"'><cite>"+loginStudent.getStudentName()+"</cite></a> 对您的问题点赞";
    			studentMessage.setStudentId(studentId);
    			studentMessage.setMessageContext(messageContext);
    			studentMessageService.insertMessage(studentMessage);
			}
			return "noStep";
		}
	}
	
	/**
	 * @param que
	 * 增加问题
	 */
	@RequestMapping("insertQuestion")
	public String insertQuestion(Question que,HttpSession session){
		//添加学生编号
		que.setStudentId((Integer)session.getAttribute("stuId"));
		//录入问题
		questionService.insertQuestion(que);
		//重定向跳转
		return "redirect:squestion.action";
	}
	/**
	 * 添加问题回复
	 * @param answer
	 * @return
	 */
	@RequestMapping("insertanswer")
	public String insertanswer(QuestionAnswer answer,Integer huiFuStudent,Integer huiFuType,HttpSession session){
	    System.out.println("回复的学生ID:"+huiFuStudent);
	    System.out.println("回复类型:"+huiFuType);
        //得到登陆者的信息
        Student  loginStudent = (Student)session.getAttribute("loginStudent");
	    
        
	    StudentMessage studentMessage = new StudentMessage();
	    String messageContext = null;
	    //主回复(评论的学生如果是该问题的发表学生)
	    if(huiFuType==0  &&  huiFuStudent != loginStudent.getStudentId()){
	        messageContext = "<a href='/Student/queryStudentInfoById.action?stuId="+loginStudent.getStudentId()+"'><cite>"+loginStudent.getStudentName()+"</cite></a>评论了您的问题&nbsp;&nbsp";
	        studentMessage.setMessageContext(messageContext);
	        studentMessage.setStudentId(huiFuStudent);
	        studentMessageService.insertMessage(studentMessage);
	    }else if(huiFuType==  1  &&  huiFuStudent != loginStudent.getStudentId()){
	        messageContext = "<a href='/Student/queryStudentInfoById.action?stuId="+loginStudent.getStudentId()+"'><cite>"+loginStudent.getStudentName()+"</cite></a>回复了您的评论&nbsp;&nbsp";
	        studentMessage.setMessageContext(messageContext);
	        studentMessage.setStudentId(huiFuStudent);
	        studentMessageService.insertMessage(studentMessage);
	    }

		//得到添加问题回复的Id
		answer.setAnswerStudentId((Integer)session.getAttribute("stuId"));
		//添加回复数据
		questionAnswerService.insertanswer(answer);
		System.out.println("得到问题ID"+answer.getAnswerQuestionId());
		Integer qid=answer.getAnswerQuestionId();
		return "redirect:questionselect.action?qid="+qid;
	}
}