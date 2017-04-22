package cn.com.zzzy.basemapper.questionmapper;

import java.util.List;

public interface QuestionAnswerMapper {
	/*
	 * 根据问题ID查询是非为空
	 * */
	public List select(Integer qid);
	/*
	 *根据问题ID删除答案
	 * */
	public void delete(Integer qid);
}
