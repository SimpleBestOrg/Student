package cn.com.zzzy.service.question;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.zzzy.basemapper.questionmapper.QuestionMapper;
import cn.com.zzzy.entity.Question;
import cn.com.zzzy.entity.Student;

@Service
public class QuestionService {
	@Autowired
	private QuestionMapper questionMapper;  

	/**
	 * 学生id查问题
	 * @param sid
	 * @return
	 */
	public List<Question> stuqueryList(Integer sid,Integer typeid,String content){
		List<Question> list=questionMapper.stuquerylist(sid,typeid,content);
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
	public List<Question> squestion(Integer typeid,String content){
		List<Question> list = questionMapper.squestion(typeid,content);
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
	 * 更新 赞+1
	 * @param step
	 * @param questionId
	 */
	public void updateStep(Integer questionId){
		questionMapper.updateStep(questionId);
	}
}
