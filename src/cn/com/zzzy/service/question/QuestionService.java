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
	/**
	 * 学生id查问题
	 * @param sid
	 * @return
	 */
	public List<Question> stuqueryList(Integer sid){
		List<Question> list=questionMapper.stuquerylist(sid);
		return list;
	}
	/**
	 * 根据问题ID查询详细信息
	 * @param pid
	 * @return
	 */
	public Question  selectname(Integer pid){
		return questionMapper.selectname(pid);
	}
	/**
	 * 查询所有问题 
	 * @return
	 */
	public List<Question> squestion(){
		List<Question> list = questionMapper.squestion();
		return list;
	}
	/**
	 * 增加问题(插入问题)
	 * @param que
	 */
	public void insertQuestion(Question que){
		questionMapper.insertQuestion(que);
	}
	/**
	 * 查询分组赞数多的热帖
	 * @return
	 */
	public List<Question> groupquestion(){
		List<Question> list=questionMapper.groupquestion();
		return list;
	}
	/**
	 * 查询热议
	 * @return
	 */
	public List<Question> commentselect(){
		List<Question> list=questionMapper.commentselect();
		return list;
	}
	/**
	 * 根据问题类别ID查询问题
	 *------------ @return
	 */
	public List<Question> typeQuestion(Integer typeid){
		List<Question> list=questionMapper.typeQuestion(typeid);
		return list;
	}
	/**
	 * 模糊查询(内容 标题)
	 * @param contenTitle
	 * @return
	 */
	public List<Question> questiondim(String contenTitle){
		List<Question> list=questionMapper.questiondim(contenTitle);
		return list;
	}
	/**
	 * 更新 赞+1
	 * @param step
	 * @param questionId
	 */
	public void updateStep(Integer questionId){
		questionMapper.updateStep(questionId);
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
