package cn.com.zzzy.controller.authority;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.zzzy.entity.Authority;
import cn.com.zzzy.service.authority.AuthorityService;
import cn.com.zzzy.util.AuthorityUtil;
import cn.com.zzzy.util.Util;

@Controller
public class AuthorityController {

	
	@Autowired
	private AuthorityService auService;
	
	/**
	 * 查询所有的权限
	 * @return
	 */
	@RequestMapping("queryAuthority")
	@ResponseBody
	public List<Authority> queryAuthority(){
		return auService.queryAuthority();
	}
	
	/**
	 * 查询用户权限
	 * @param authorityId
	 * @return
	 */
	@RequestMapping("queryAccountAuthority")
	@ResponseBody
	public List<AuthorityUtil> queryAccountAuthority(Integer authorityId){
		return auService.queryAccountAuthority(authorityId);
	}
	
	/**
	 * 修改权限
	 * @param accountId
	 * @param ids
	 */
	@RequestMapping("saveAuthority")
	@ResponseBody
	public void saveAuthority(Integer accountId,String ids){
		auService.saveAuthority(accountId,ids);
	}
	
	/**
	 * 修改或添加权限名称
	 * @param vo
	 */
	@RequestMapping("insertOrupdateAuthority")
	@ResponseBody
	public void insertOrupdateAuthority(Authority vo){
		String msg = auService.insertOrupdateAuthority(vo);
		Util.Writer(msg);
	}
	
	/**
	 * 删除权限名称
	 * @param authorityId
	 */
	@RequestMapping("deleteAuthority")
	@ResponseBody
	public void deleteAuthority(Integer authorityId){
		String msg = auService.deleteAuthority(authorityId);
		Util.Writer(msg);
	}
}
