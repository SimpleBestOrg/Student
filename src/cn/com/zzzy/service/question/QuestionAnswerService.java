package cn.com.zzzy.service.question;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.zzzy.basemapper.questionmapper.QuestionAnswerMapper;
import cn.com.zzzy.entity.QuestionAnswer;
@Service
public class QuestionAnswerService {
	@Autowired
	private QuestionAnswerMapper questionAnswerMapper;
	/**
	 * 添加回复
	 * @param answer
	 */
	public void insertanswer(QuestionAnswer answer){
		questionAnswerMapper.insertanswer(answer);
	}	
	public List<QuestionAnswer> select(Integer qid){
			List<QuestionAnswer> list = new ArrayList<>();
		if(questionAnswerMapper.select(qid)!=null){
		  	list=questionAnswerMapper.select(qid);
		}else{
			System.out.println("此问题暂时还没有答案");
		}
		return list;
	}
	
	public void delete(Integer qid){
		questionAnswerMapper.delete(qid);
	}
	
}
