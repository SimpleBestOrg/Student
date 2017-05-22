package cn.com.zzzy.service.question;

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

	/**
	 * 回答榜（统计）
	 * @return
	 */
	public List<QuestionAnswer> answerselect(){
		List<QuestionAnswer> list=questionAnswerMapper.answerselect();
		return list;
	}
}
