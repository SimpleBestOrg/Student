package cn.com.zzzy.basemapper.questionmapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.com.zzzy.entity.Question;
/**
 * 问题表
 * 1.根据问题类型查询问题
 * 2.根据学生id查询问题
 * */
public interface QuestionMapper{
	//查询每个学生提的问题
	public List<Question> stuquerylist(Integer sid);
	//根据问题ID查询详细信息
	public Question selectname(@Param("qid") Integer qid);
	//查询所有问题
	public List<Question> squestion();
	//分组查询热帖
	public List<Question> groupquestion();
	//查询热议
	public List<Question> commentselect();
	//根据问题类型ID查询问题
	public List<Question> typeQuestion(Integer typeid);
	//根据问题ID删除问题
	public void delete(Integer deid);
	//更新赞的次数
	public void updateStep(Integer questionId);
	//模糊查询
	public List<Question> questiondim(String contenTitle);
	//添加问题
	public void insertQuestion(Question que);
}
