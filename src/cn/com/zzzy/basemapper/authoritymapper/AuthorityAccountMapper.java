package cn.com.zzzy.basemapper.authoritymapper;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.com.zzzy.entity.AuthorityAccount;
import cn.com.zzzy.entity.Student;
import cn.com.zzzy.entity.Teacher;
import cn.com.zzzy.util.AuthorityAccountUtil;

/**
 * 用户
 * 
 * @author Jao
 *
 */
public interface AuthorityAccountMapper {
	/**
	 * 登陆验证
	 * 
	 * @return
	 */
	AuthorityAccount queryAccountLanding(AuthorityAccount vo);

	/**
	 * 模糊查询学生及其Id
	 * @param vo
	 * @return
	 */
	List<Student> queryVagueAccStudent(AuthorityAccountUtil vo);
	
	/**
	 * 配合queryVagueAccStudent方法  实现分页   该方法 统计 学生总人数
	 * @param vo
	 * @return
	 */
	int queryVagueAccStudentcount(AuthorityAccountUtil vo);
	
	/**
	 * 模糊查询老师及其Id
	 * @param vo
	 * @return
	 */
	List<Teacher> queryVagueAccTeacher(AuthorityAccountUtil vo);
	
	/**
	 * 配合queryVagueAccTeacher方法  实现分页   该方法 统计 老师总人数
	 * @param vo
	 * @return
	 */
	int queryVagueAccTeachercount(AuthorityAccountUtil vo);
	
	/**
	 *  添加账户
	 * @param authorityAccount
	 */
	void insertAuthorityAccount(@Param("obj") AuthorityAccount authorityAccount);
}


