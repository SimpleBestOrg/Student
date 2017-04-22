package cn.com.zzzy.controller.question;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.zzzy.service.question.QuestionAnswerService;

@Controller
public class QuestionAnswerController {
	@Autowired
	private QuestionAnswerService questionAnswerService;
	@RequestMapping("answselecte")
	@ResponseBody
	public List answselecte(Integer qid){
		List list=questionAnswerService.select(1);
		return list;
	}
	@RequestMapping("answdelete")
	@ResponseBody
	public void answdelete(Integer qid){
		questionAnswerService.delete(qid);
	}
}
