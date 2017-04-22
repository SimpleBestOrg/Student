package cn.com.zzzy.basemapper.questionmapper;


import java.util.List;

import cn.com.zzzy.entity.Question;
import cn.com.zzzy.entity.QuestionType;
/*
 * 问题类型接口
 * 1.查询所有类型
 * 2.根据问题查类型查询对应的问题
 * */
public interface QuestionTypeMapper{
	//查询所有类型
	public List<QuestionType> selecall();
	//根据问题查类型查询对应的问题
	public List<Question> selecttype(Integer tid);
}
