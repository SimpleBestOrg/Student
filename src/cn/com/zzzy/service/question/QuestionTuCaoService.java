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
	public List<QuestionTuCao> select(Integer qid){
		List<QuestionTuCao> list=questionTuCaoMapper.select(qid);
		return list;
	}
	public void delete(Integer qid){
		if(qid!=null){
			questionTuCaoMapper.delete(qid);
		}else{
			System.out.println("你的问题还没有人吐槽");
		}
	}
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
