package cn.com.zzzy.entity;

public class AuthorityAccount {
	private Integer accountId;
	private Integer studentId;
	private Integer teacherId;
	private String accountName;
	private String accountPwd;
	
	
	public AuthorityAccount() {
		super();
	}


	public Integer getAccountId() {
		return accountId;
	}


	public void setAccountId(Integer accountId) {
		this.accountId = accountId;
	}


	public Integer getStudentId() {
		return studentId;
	}


	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}


	public Integer getTeacherId() {
		return teacherId;
	}


	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}


	public String getAccountName() {
		return accountName;
	}


	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}


	public String getAccountPwd() {
		return accountPwd;
	}


	public void setAccountPwd(String accountPwd) {
		this.accountPwd = accountPwd;
	}
	
	
}
