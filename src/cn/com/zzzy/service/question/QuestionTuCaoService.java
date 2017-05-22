package cn.com.zzzy.service.question;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.zzzy.basemapper.questionmapper.QuestionTuCaoMapper;
import cn.com.zzzy.entity.QuestionTuCao;
@Service
public class QuestionTuCaoService {
	@Autowired
	private QuestionTuCaoMapper questionTuCaoMapper;
	
	/**
	 * 添加吐槽表信息
	 * @param questiontiontu
	 */
	public void insertTucao(QuestionTuCao questiontiontu){
		questionTuCaoMapper.insertTucao(questiontiontu);
	}
	/**
	 * 查询点赞学生是否存在
	 * @param questionTuCao
	 * @return
	 */
	public Integer  queryTuCaoStudent(QuestionTuCao questionTuCao){
		
		return questionTuCaoMapper.queryTuCaoStudent(questionTuCao);
	}
	
	
}
