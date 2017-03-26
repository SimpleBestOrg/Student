package cn.com.zzzy.entity;
/**
 * 问题类型表
 * @author Admin
 *
 */
public class QuestionType {
	private int quesetionTypeId;//问题类型ID
	private String quesetionTypeName;//类型的名称
	public int getQuesetionTypeId() {
		return quesetionTypeId;
	}
	public void setQuesetionTypeId(int quesetionTypeId) {
		this.quesetionTypeId = quesetionTypeId;
	}
	public String getQuesetionTypeName() {
		return quesetionTypeName;
	}
	public void setQuesetionTypeName(String quesetionTypeName) {
		this.quesetionTypeName = quesetionTypeName;
	}
	
}
