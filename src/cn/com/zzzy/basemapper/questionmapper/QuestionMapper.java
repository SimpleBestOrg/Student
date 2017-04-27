package cn.com.zzzy.basemapper.questionmapper;

import java.util.List;

import cn.com.zzzy.basemapper.BaseMapper;
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
	public List<Question> selectname(Integer qid);
	//查询所有问题
	public List<Question> squestion();
	//根据问题ID删除问题
	public void delete(Integer deid);
	//添加问题
	public void insertadd(Question que);
}
