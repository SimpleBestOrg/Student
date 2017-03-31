package cn.com.zzzy.basemapper;

import java.util.List;

import cn.com.zzzy.util.PageParam;

/**
 * 所有的mapper接口均继承此接口
 * @author Admin
 *
 */
public interface BaseMapper<T> {

    /**
     * 根据条件分页查询所有
     * @param id
     * @return
     */
    List<T> queryList(PageParam param,T t);
    
    /**
     * 根据条件查询得到的数据量
     * @param t
     * @return
     */
    int   queryCount(T t);
    
    /**
     * 根据ID删除
     * @param id
     */
    void delete(Integer id);

    
    /**
     * 根据条件增加
     * @param obj
     */
    void save(Object obj);

    
    /**
     * 根据条件更新
     * @param obj
     */
    void update(Object obj);

}
