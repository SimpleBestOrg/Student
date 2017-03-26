package cn.com.zzzy.basemapper;

import java.util.List;

/**
 * 所有的mapper接口均继承此接口  
 * @author Admin
 *
 */
public interface BaseMapper {
	
	//根据条件查询
	public List<Class> queryList(Integer id);
	
	//根据条件删除
	public void delete(Object obj);
	
	//根据条件增加
	public void  save(Object obj);
	
	//根据条件更新 
	public void  update(Object obj); 
	
}
