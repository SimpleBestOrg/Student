package cn.com.zzzy.basemapper.activitymapper;

import cn.com.zzzy.basemapper.BaseMapper;
import cn.com.zzzy.entity.ActivityPhoto;

/**
 * 活动照片mapper
 * @author Admin
 *
 */
public interface ActivityPhotoMapper extends BaseMapper{
        //插入图片
       int insert(ActivityPhoto ap);
}
