package cn.com.zzzy.basemapper.questionmapper;

import java.util.List;

import cn.com.zzzy.entity.QuestionTuCao;

public interface QuestionTuCaoMapper {
	/**
	 * 根据问题id查询有无评价
	 */
	public List<QuestionTuCao> select(Integer qid);
	/**
	 * 添加桥梁表内容
	 */
	public void insertTucao(QuestionTuCao questiontiontu);
	/*
	 * 根据问题ID删除吐槽信息
	 * */
	public void delete(Integer qid);
	
	/**
	 * 查询点赞学生是否存在
	 * @param questionTuCao
	 * @return
	 */
	public Integer queryTuCaoStudent(QuestionTuCao questionTuCao);
}
