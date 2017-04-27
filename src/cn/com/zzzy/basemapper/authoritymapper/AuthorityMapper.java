package cn.com.zzzy.basemapper.authoritymapper;

import java.util.List;

import cn.com.zzzy.entity.Authority;
import cn.com.zzzy.entity.AuthorityAccountBridge;

public interface AuthorityMapper {

	/**
	 * 根据用户Id查询权限
	 * @param authorityId
	 * @return
	 */
	List<Authority> queryAccountAuthority(Integer authorityId);
	
	
	/**
	 * 查询所有权限
	 * @return
	 */
	List<Authority> queryAuthority();
	
	/**
	 * 用户权限修改 - 添加
	 * @param vo
	 */
	void insertAccountAuthority(AuthorityAccountBridge vo);
	
	/**
	 * 用户权限修改 - 删除
	 * @param accountId 
	 */
	void deleteAccountAuthority(Integer accountId);
	
	/**
	 * 权限名称修改
	 * @param vo
	 */
	void updateAuthority(Authority vo);
	
	/**
	 * 权限名称插入
	 * @param vo
	 */
	void insertAuthority(Authority vo);
	
	/**
	 * 查询某个已占用权限数量
	 * @param authorityId
	 * @return
	 */
	Integer queryAuthorityCount(Integer authorityId);
	
	/**
	 * 删除权限名称
	 * @param authorityId
	 */
	void deleteAuthority(Integer authorityId);
}
