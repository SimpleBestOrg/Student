package cn.com.zzzy.service.authority;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.zzzy.basemapper.authoritymapper.AuthorityAccountMapper;
import cn.com.zzzy.entity.AuthorityAccount;
import cn.com.zzzy.util.AuthorityAccountUtil;


@Service
public class AuthorityAccountService {

	@Autowired
	private AuthorityAccountMapper auAcMapper;

	/**
	 * 用户登陆验证
	 * 
	 * @param vo
	 * @return
	 */
	public AuthorityAccount queryAccountLanding(AuthorityAccount vo) {
		return auAcMapper.queryAccountLanding(vo);
	}

	/**
	 * 查询老师、学生及Accid
	 * 
	 * @param id
	 * @param value
	 * @param rows
	 * @param page
	 * @return
	 */
	public Map<String,Object> queryAccountTeaStu(Integer id,String value,Integer rows,Integer page){
		//传入ID =1  则表明是老师  执行查询老师的方法
		AuthorityAccountUtil vo= new AuthorityAccountUtil();
		Map<String,Object> jsonMap = new HashMap<String,Object>();
		if(page==null){
			page=1;
		}
		if(rows==null){
			rows=10;
		}
		int start = (page-1)*rows;
		vo.setTotal(start);
		vo.setRows(rows);
		if(id==1){
				vo.setTeaName(value);
				jsonMap.put("rows", auAcMapper.queryVagueAccTeacher(vo));
				jsonMap.put("total", auAcMapper.queryVagueAccTeachercount(vo));
				return jsonMap;
		}else{
				vo.setStuName(value);
				jsonMap.put("rows", auAcMapper.queryVagueAccStudent(vo));
				jsonMap.put("total", auAcMapper.queryVagueAccStudentcount(vo));
				return jsonMap;
		}
		
	}
	
	/**
	 * 添加登录账户
	 * @param account
	 */
	public void  insertAuthorityAccount(AuthorityAccount account){
	             auAcMapper.insertAuthorityAccount(account);  
	}

}
