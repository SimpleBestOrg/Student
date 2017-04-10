package cn.com.zzzy.basemapper.activitymapper;

import java.util.List;

import cn.com.zzzy.basemapper.BaseMapper;
import cn.com.zzzy.entity.ActivityPhoto;

/**
 * 活动照片mapper
 * @author Admin
 *
 */
public interface ActivityPhotoMapper extends BaseMapper {
    /**
     * 一次插入单张图片
     * @param ap
     * @return
     */
    int insert(ActivityPhoto ap);

    /**
     * 根据活动记录ID查询多张活动照片
     * @param recordId
     * @return
     */
    List<ActivityPhoto> queryActivityPhotoList(Integer recordId);

}
