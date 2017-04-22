package cn.com.zzzy.controller.question;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.zzzy.service.question.QuestionTuCaoService;

@Controller
public class QuestionTuCaoController {
	@Autowired
	private QuestionTuCaoService questionTuCaoService;
	@RequestMapping("tocaoselect")
	@ResponseBody
	public List tocaoselect(Integer qid){
		List list=questionTuCaoService.select(qid);		
		return list;
	}
	@RequestMapping("tucaodelete")
	@ResponseBody
	public void tucaodelete(Integer qid){
		questionTuCaoService.delete(qid);
	}
}
