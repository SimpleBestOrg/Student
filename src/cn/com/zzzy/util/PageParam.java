package cn.com.zzzy.util;

/**
 *  
 * @author Admin
 *
 */
public class PageParam {

	private Integer page;
	private Integer rows;

	public PageParam() {
	}

	public PageParam(Integer page, Integer rows) {
		this.page = page;
		this.rows = rows;
	}

	private int startIndex;

	public Integer getPage() {
		return page == null || page < 1 ? 1 : page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getRows() {
		return rows == null || rows <= 0 ? 10 : rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	public int getStartIndex() {
		return (getPage() - 1) * getRows();
	}
}
