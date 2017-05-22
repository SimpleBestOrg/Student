package cn.com.zzzy.basemapper.questionmapper;

import java.util.List;

import cn.com.zzzy.entity.QuestionTuCao;

public interface QuestionTuCaoMapper {

	/**
	 * 添加桥梁表内容
	 */
	public void insertTucao(QuestionTuCao questiontiontu);
	
	/**
	 * 查询点赞学生是否存在
	 * @param questionTuCao
	 * @return
	 */
	public Integer queryTuCaoStudent(QuestionTuCao questionTuCao);
}
