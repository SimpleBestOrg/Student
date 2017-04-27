package cn.com.zzzy.service.authority;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.zzzy.basemapper.authoritymapper.AuthorityMapper;
import cn.com.zzzy.entity.Authority;
import cn.com.zzzy.entity.AuthorityAccountBridge;
import cn.com.zzzy.util.AuthorityUtil;

@Service
public class AuthorityService {

	@Autowired
	private AuthorityMapper auMapper;
	
	/**
	 * 查询所有的权限
	 * @return
	 */
	public List<Authority> queryAuthority(){
		return auMapper.queryAuthority();
	}
	
	/**
	 * 查询用户的权限  （根据用户 查询用户权限）
	 * @param authorityId  用户id
	 * @return
	 */
	public List<AuthorityUtil> queryAccountAuthority(Integer authorityId){
		List<AuthorityUtil> listUtil = new ArrayList<AuthorityUtil>();
		List<Authority>  list = this.queryAuthority();
		for (Authority authority : list) {
			AuthorityUtil util = new AuthorityUtil(authority.getAuthorityId(),authority.getAuthorityName());
			if(authorityId!=null){
				List<Authority> listau = auMapper.queryAccountAuthority(authorityId);
				
				for (Authority authority2 : listau) {
					if(authority.getAuthorityId().intValue()==authority2.getAuthorityId().intValue()){
						util.setSign(1);
					}
				}
			}
			listUtil.add(util);
			
		}
		return listUtil;
	}

	/**
	 * 修改权限
	 * @param accountId
	 * @param ids
	 */
	public void saveAuthority(Integer accountId, String ids) {
		try {
			String [] id = ids.split(",");
			auMapper.deleteAccountAuthority(accountId);
			AuthorityAccountBridge vo = new AuthorityAccountBridge();
			vo.setAuthorityAccountId(accountId);
			for (String string : id) {
				vo.setAuthorityId(Integer.parseInt(string));
				auMapper.insertAccountAuthority(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 添加或修改权限名称
	 * @param vo
	 * @return
	 */
	public String insertOrupdateAuthority(Authority vo){
		try {
			if(vo.getAuthorityId()!=null){
				auMapper.updateAuthority(vo);
				return "修改成功~";
			}else{
				auMapper.insertAuthority(vo);
				return "添加成功~";
			}
		} catch (Exception e) {
			return "失败~";
		}
	}
	
	/**
	 * 权限名称删除
	 * @param authorityId
	 * @return
	 */
	public String deleteAuthority(Integer authorityId){
		try {
			int i = auMapper.queryAuthorityCount(authorityId);
			if(i==0){
				auMapper.deleteAuthority(authorityId);
				return "删除成功~";
			}else{
				return "删除失败~";
			}
		} catch (Exception e) {
			return "删除失败~";
		}
	}
}
