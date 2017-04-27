package cn.com.zzzy.util;

import java.util.ArrayList;
import java.util.List;

public class AuthorityMenuUtil {
	private Integer menuId;
	private String menuName;
	private Integer menuParentId;
	private String menuUrl;
	private Integer sign = 0;
	private List<AuthorityMenuUtil> children = new ArrayList<AuthorityMenuUtil>();

	public AuthorityMenuUtil() {
		super();
	}

	public AuthorityMenuUtil(Integer menuId, String menuName, Integer menuParentId, String menuUrl) {
		super();
		this.menuId = menuId;
		this.menuName = menuName;
		this.menuParentId = menuParentId;
		this.menuUrl = menuUrl;
	}

	public Integer getMenuId() {
		return menuId;
	}

	public void setMenuId(Integer menuId) {
		this.menuId = menuId;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public Integer getMenuParentId() {
		return menuParentId;
	}

	public void setMenuParentId(Integer menuParentId) {
		this.menuParentId = menuParentId;
	}

	public String getMenuUrl() {
		return menuUrl;
	}

	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}

	public Integer getSign() {
		return sign;
	}

	public void setSign(Integer sign) {
		this.sign = sign;
	}

	public List<AuthorityMenuUtil> getChildren() {
		return children;
	}

	public void setChildren(List<AuthorityMenuUtil> children) {
		this.children = children;
	}

}
