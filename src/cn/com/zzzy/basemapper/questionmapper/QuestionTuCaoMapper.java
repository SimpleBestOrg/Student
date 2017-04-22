package cn.com.zzzy.basemapper.questionmapper;

import java.util.List;

public interface QuestionTuCaoMapper {
	/*
	 * 根据问题id查询有无评价
	 * */
	public List select(Integer qid);
	/*
	 * 根据问题ID删除吐槽信息
	 * */
	public void delete(Integer qid);
	
}
