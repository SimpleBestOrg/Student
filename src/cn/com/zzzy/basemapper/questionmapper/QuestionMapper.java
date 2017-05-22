package cn.com.zzzy.basemapper.questionmapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.com.zzzy.entity.Question;
import cn.com.zzzy.entity.Student;
/**
 * 问题表
 * 1.根据问题类型查询问题
 * 2.根据学生id查询问题
 * */
public interface QuestionMapper{
	//查询每个学生提的问题 以及 类别查询   以及 模糊查询
	public List<Question> stuquerylist(@Param("sid")Integer sid,@Param("typeid")Integer typeid,@Param("content")String content);
	//根据问题ID查询详细信息
	public Question selectname(@Param("qid") Integer qid);
	//查询所有问题 以及 类别查询 以及 模糊查询
	public List<Question> squestion(@Param("typeid")Integer typeid,@Param("content")String content);
	//分组查询热帖
	public List<Question> groupquestion();
	//查询热议
	public List<Question> commentselect();
	//更新赞的次数
	public void updateStep(Integer questionId);
	//模糊查询
	public List<Question> questiondim(String contenTitle);
	//添加问题
	public void insertQuestion(Question que);
}
