package cn.com.zzzy.util;

import java.util.List;

/**
 * 对查询出的总数和数据进行封装
 * @author Admin
 *
 */
public class PageData {

	private int total;
	private List rows;
	public PageData(){}
	public PageData(int n ,List rows){
		this.total= n;
		this.rows = rows;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public List getRows() {
		return rows;
	}
	public void setRows(List rows) {
		this.rows = rows;
	}
}
