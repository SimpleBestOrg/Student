package cn.com.zzzy.controller.authority;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.zzzy.entity.AuthorityMenu;
import cn.com.zzzy.service.authority.AuthorityMenuService;
import cn.com.zzzy.util.AuthorityMenuUtil;
import cn.com.zzzy.util.Util;

@Controller
public class AuthorityMenuController {

	
	@Autowired
	private AuthorityMenuService auMeService;
	
	/**
	 * 查询所有的菜单
	 * @return
	 */
	@RequestMapping("queryAuthorityMenu")
	@ResponseBody
	public List<AuthorityMenuUtil> queryAuthorityMenu(){
		return auMeService.queryAccountMenu(null);
	}
	
	/**
	 * 查询某一权限的菜单
	 * @return
	 */
	@RequestMapping("queryOneAuthorityMenu")
	@ResponseBody
	public List<AuthorityMenuUtil> queryOneAuthorityMenu(Integer authorityId){
		return auMeService.queryOneAuthorityMenu(authorityId);
	}
	
	
	/**
	 * 查询所有的主菜单
	 * @return
	 */
	@RequestMapping("queryAuthorityParentMenu")
	@ResponseBody
	public List<AuthorityMenu> queryAuthorityParentMenu(){
		return auMeService.queryAuthorityParentMenu();
	}
	
	/**
	 * 菜单的添加或修改
	 * @param vo
	 */
	@RequestMapping("insertOrUpdateAuthorityMenu")
	@ResponseBody
	public void insertOrUpdateAuthorityMenu(AuthorityMenu vo){
		String msg = auMeService.insertOrUpdateAuthorityMenu(vo);
		Util.Writer(msg);
	}
	
	
	/**
	 * 菜单的删除  (该操作中 验证了 菜单下是否有子菜单  以及 该菜单 是否被权限占用)
	 * @param menuId
	 */
	@RequestMapping("deleteAuthorityMenu")
	@ResponseBody
	public void deleteAuthorityMenu(Integer menuId){
		String msg = auMeService.deleteAuthorityMenu(menuId);
		Util.Writer(msg);
	}
	
	/**
	 * 某一权限 相对应的菜单 的修改
	 * @param authority
	 * @param ids
	 */
	@RequestMapping("updateAuthorityMenu")
	public void updateAuthorityMenu(Integer authorityId,String ids){
		auMeService.updateAuthorityMenu(authorityId,ids);
	}
}
