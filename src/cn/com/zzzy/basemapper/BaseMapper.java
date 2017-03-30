package cn.com.zzzy.basemapper;

import java.util.List;

/**
 * 所有的mapper接口均继承此接口  
 * @author Admin
 *
 */
public interface BaseMapper<T> {

    // 根据条件查询
    List<T> queryList(Integer id);

    // 根据条件删除
    void delete(Integer id);

    // 根据条件增加
    void save(Object obj);

    // 根据条件更新
    void update(Object obj);

}
