package cn.com.zzzy.basemapper.authoritymapper;

import java.util.List;

import cn.com.zzzy.entity.AuthorityMenu;
import cn.com.zzzy.entity.AuthorityMenuBridge;

public interface AuthorityMenuMapper {

	/**
	 * 查询所有菜单
	 * 
	 * @return
	 */
	List<AuthorityMenu> queryAuthorityMenu();

	/**
	 * 查询登陆用户的权限
	 * 
	 * @param accountId
	 *            登陆用户的Id
	 * @return
	 */
	List<AuthorityMenu> queryAccountMenu(Integer accountId);

	/**
	 * 查询所有的主菜单
	 * 
	 * @return
	 */
	List<AuthorityMenu> queryAuthorityParentMenu();

	/**
	 * 添加权限菜单
	 * 
	 * @param vo
	 *            菜单对象
	 */
	void insertAuthorityMenu(AuthorityMenu vo);

	/**
	 * 修改权限菜单
	 * @param vo
	 */
	void updateAuthorityMenu(AuthorityMenu vo);

	/**
	 * 菜单删除
	 * @param menuId
	 */
	void deleteAuthorityMenu(Integer menuId);
	
	/**
	 * 删除菜单时验证该菜单下是否有子菜单
	 * @param menuid  菜单Id
	 * @return
	 */
	int queryDeleteAuthorityParentMenu(Integer menuid);
	
	/**
	 * 删除菜单时验证该菜单是否被权限占用
	 * @param menuid
	 * @return
	 */
	int queryDeleteAuthoritytMenu(Integer menuid);

	/**
	 * 查询某一权限菜单
	 * @param authority
	 * @return
	 */
	List<Integer> queryOneAuthoritytMenu(Integer authorityId);
	/**
	 * 对某一权限 进行修改 先执行删除
	 * @param authorityId
	 */
	void deleteOneAuthorityMenu(Integer authorityId);
	
	/**
	 * 对某一权限 进行修改 再进行添加
	 * @param vo
	 */
	void insertOneAuthorityMenu(AuthorityMenuBridge vo);
}
