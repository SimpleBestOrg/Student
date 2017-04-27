package cn.com.zzzy.util;

/**
 *  
 * @author Admin
 *
 */
public class PageParam {

	private Integer page;
	private Integer rows;
	private String  keyWord;

	public PageParam() {
	}

	public PageParam(Integer page, Integer rows) {
		this.page = page;
		this.rows = rows;
	}
	//查询的起始下标
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

    public String getKeyWord() {
        return keyWord;
    }

    public void setKeyWord(String keyWord) {
        this.keyWord = keyWord;
    }
	
}
