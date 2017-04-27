package cn.com.zzzy.util;

public class AuthorityUtil {

	private Integer authorityId;
	private String authorityName;
	private Integer sign = 0;
	
	
	
	public AuthorityUtil(Integer authorityId, String authorityName) {
		super();
		this.authorityId = authorityId;
		this.authorityName = authorityName;
	}
	public AuthorityUtil() {
		super();
	}
	public Integer getAuthorityId() {
		return authorityId;
	}
	public void setAuthorityId(Integer authorityId) {
		this.authorityId = authorityId;
	}
	public String getAuthorityName() {
		return authorityName;
	}
	public void setAuthorityName(String authorityName) {
		this.authorityName = authorityName;
	}
	public Integer getSign() {
		return sign;
	}
	public void setSign(Integer sign) {
		this.sign = sign;
	}
	
	
	
}
