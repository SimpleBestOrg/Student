package cn.com.zzzy.service.question;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.zzzy.basemapper.questionmapper.QuestionMapper;
import cn.com.zzzy.entity.Question;

@Service
public class QuestionService {
	@Autowired
	private QuestionMapper questionMapper;  
	@Autowired
	private QuestionAnswerService questionAnswerService;
	@Autowired
	private QuestionTuCaoService questionTuCaoService;
	/*
	 * 学生id查问题
	 * */
	public List stuqueryList(Integer sid){
		List list=questionMapper.stuquerylist(sid);
		System.out.println("根据学生id查的问你题service");
		return list;
	}
	/*
	 * 根据问题ID查询详细信息
	 * */
	public List selectname(Integer pid){
		List list=questionMapper.selectname(pid);
		System.out.println("根据问题ID查询详细信息");
		return list;
	}
	/*
	 *查询所有问题 
	 * */
	public List<Question> squestion(){
		List<Question> list = questionMapper.squestion();
		return list;
	}
	/*
	 * 增加问题(插入问题)
	 * */
	public void add(Question que){
		questionMapper.insertadd(que);
	}
	/*
	 * 删除问题
	 * 调用答案查询有数据删除答案
	 * 调用吐槽查询有数据删除吐槽
	 * */
	public void delete(Integer deid){
		questionAnswerService.select(deid);
		questionTuCaoService.select(deid);
		questionMapper.delete(deid);
		
	}
}
