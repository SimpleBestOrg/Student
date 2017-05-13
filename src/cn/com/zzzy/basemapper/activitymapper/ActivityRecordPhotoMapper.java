package cn.com.zzzy.basemapper.activitymapper;

import java.util.List;

import cn.com.zzzy.basemapper.BaseMapper;
import cn.com.zzzy.entity.ActivityRecordPhoto;

/**
 * 活动照片mapper
 * @author Admin
 *
 */
public interface ActivityRecordPhotoMapper extends BaseMapper {
    /**
     * 一次插入单张图片
     * @param ap
     * @return
     */
    void insertActivityRecordPhoto(ActivityRecordPhoto ap);

    /**
     * 根据活动记录ID查询多张活动照片
     * @param recordId
     * @return
     */
    List<ActivityRecordPhoto> queryActivityPhotoList(Integer recordId);

}
