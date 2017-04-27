package cn.com.zzzy.service.authority;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.zzzy.basemapper.authoritymapper.AuthorityMenuMapper;
import cn.com.zzzy.entity.AuthorityMenu;
import cn.com.zzzy.entity.AuthorityMenuBridge;
import cn.com.zzzy.util.AuthorityMenuUtil;

@Service
public class AuthorityMenuService {

	
	@Autowired
	private AuthorityMenuMapper auMeMapper;
	
	/**
	 * 查询所有菜单
	 * @return
	 */
	public List<AuthorityMenu> queryAuthorityMenu(){
		return auMeMapper.queryAuthorityMenu();
	}
	
	/**
	 * 查询某一权限的菜单
	 * @param authorityId
	 * @return
	 */
	public List<AuthorityMenuUtil> queryOneAuthorityMenu(Integer authorityId){
		
		List<AuthorityMenuUtil> listAuthorityUtil = this.queryAccountMenu(null);  // 调用当前类的查询方法
		
		if(authorityId!=null){	
			List<Integer> list = auMeMapper.queryOneAuthoritytMenu(authorityId);
			 for (AuthorityMenuUtil menusUtil : listAuthorityUtil) {
				 for (Integer integer : list) {
					if(integer.intValue()==menusUtil.getMenuId().intValue()){
						menusUtil.setSign(1);
					}
				}
				for (AuthorityMenuUtil util : menusUtil.getChildren()) {
					for (Integer integer : list) {
						if(integer.intValue()==util.getMenuId().intValue()){
							util.setSign(1);
						}
					}
				}
			 }
		}
		return listAuthorityUtil;
	}
	
	
	/**
	 * 查询权限 若传入accountId  则执行查询某一用户权限  否则  查询所有菜单
	 * @param accountId
	 * @return
	 */
	public List<AuthorityMenuUtil> queryAccountMenu(Integer accountId){
		List<AuthorityMenuUtil> listUtil = new ArrayList<AuthorityMenuUtil>();
		System.out.println("账户ID："+accountId);
		List<AuthorityMenu> ListMe = new ArrayList<AuthorityMenu>();
		if(accountId==null){
			ListMe = this.queryAuthorityMenu();   //传入ID 为NUll 查询所有菜单
		}else if(accountId!=null){
			ListMe =auMeMapper.queryAccountMenu(accountId); // 根据 传入的用户ID 查询对应得 菜单
		}
		AuthorityMenuUtil Util = null;
		for (AuthorityMenu menus : ListMe) {
			/**
			 * 将查询出的对象集合（ListMe） 一一遍历 ，对象中其父级字段（MenuParentId）若为0 或为 null 则说明该对象是父级菜单
			 * 将其压入 辅助类对象（AuthorityMenuUtil）Util中
			 */
			if(menus.getMenuParentId().intValue()==0||menus.getMenuParentId()==null){
				Util = new AuthorityMenuUtil(menus.getMenuId(),menus.getMenuName(),menus.getMenuParentId(),menus.getMenuUrl());
				
				List<AuthorityMenuUtil> listMu =new ArrayList<AuthorityMenuUtil>();
				/**
				 *遍历内部（menus） 再次遍历 ListMe (menu) 拿其父级(Util)字段与 上面便利的对象(menus)的ID字段比较 
				 *如若相同 则再次声明 辅助对象 并压入其中,之后再压入 新声明的辅助类集合（listMu）中
				 *最后将其压入父级（Util）对象 的children 字段中
				 */
				for (AuthorityMenu menu : ListMe) {
					if(menus.getMenuId().intValue()==menu.getMenuParentId().intValue()){
						AuthorityMenuUtil Mu = new AuthorityMenuUtil(menu.getMenuId(),menu.getMenuName(),menu.getMenuParentId(),menu.getMenuUrl());
						listMu.add(Mu);
					}
				}
				Util.setChildren(listMu);
				listUtil.add(Util);
			}
		}
		return listUtil;
	}

	/**
	 * 查询所有的主菜单
	 * @return
	 */
	public List<AuthorityMenu> queryAuthorityParentMenu() {
		return auMeMapper.queryAuthorityParentMenu();
	}

	/**
	 * 添加或修改菜单
	 * @param vo
	 */
	public String insertOrUpdateAuthorityMenu(AuthorityMenu vo) {
		if(vo.getMenuId()!=null){
			try {
				auMeMapper.updateAuthorityMenu(vo);
				return "修改成功~";
			} catch (Exception e) {
				return "修改失败~";
			}
		}else{
			try {
				auMeMapper.insertAuthorityMenu(vo);
				return "添加成功~";
			} catch (Exception e) {
				return "添加失败~";
			}
		}
	}
	
	/**
	 * 删除菜单     i :该菜单下子菜单个数 
	 * 			ii :该菜单 被多少权限占用
	 * @param menuId
	 * @return
	 */
	public String deleteAuthorityMenu(Integer menuId){
		try {
			int i=auMeMapper.queryDeleteAuthorityParentMenu(menuId);
			int ii = auMeMapper.queryDeleteAuthoritytMenu(menuId);
			if(i!=0){
				return "该菜单是主菜单~请先删除下面的子菜单~";
			}
			if(ii!=0){
				return "该菜单被权限所占用~请先解除权限~";
			}
			if(i==0&&ii==0){
				auMeMapper.deleteAuthorityMenu(menuId);
				return "删除成功~";
			}
			return "";
		} catch (Exception e) {
			return "删除失败~";
		}
	}

	/**
	 * 某一权限 相对应的菜单 的修改
	 * @param authority
	 * @param ids
	 */
	public void updateAuthorityMenu(Integer authorityId, String ids) {
		String[] str = ids.split(",");
		AuthorityMenuBridge vo = new AuthorityMenuBridge();
		try {
			auMeMapper.deleteOneAuthorityMenu(authorityId);
			for (String string : str) {
				vo.setAuthorityId(authorityId);
				vo.setMenuId(Integer.parseInt(string));
				auMeMapper.insertOneAuthorityMenu(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
