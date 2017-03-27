package cn.com.zzzy.basemapper.activitymapper;

import java.util.List;

import cn.com.zzzy.basemapper.BaseMapper;
import cn.com.zzzy.entity.Activity;

/**
 * 活动mapper
 * @author  Admin
 *
 */

public interface ActivityMapper extends BaseMapper {
    /**
     * 查询全部
     * @return 返回所有查询结果
     */
    List<Activity> queryList();
}
