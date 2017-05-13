package cn.com.zzzy.basemapper.questionmapper;

import java.util.List;

import cn.com.zzzy.entity.QuestionAnswer;

public interface QuestionAnswerMapper {
	/*
	 * 根据问题ID查询是非为空
	 * */
	public List<QuestionAnswer> select(Integer qid);
	/*
	 *根据问题ID删除答案
	 * */
	public void delete(Integer qid);
	/**
	 * 添加回复
	 * @param answer
	 */
	public void insertanswer(QuestionAnswer answer);
}
