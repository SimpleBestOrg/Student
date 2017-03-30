package cn.com.zzzy.service;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import cn.com.zzzy.basemapper.activitymapper.ActivityPhotoMapper;
import cn.com.zzzy.entity.ActivityPhoto;

/**
 * 测试之后  可删除
 * @author Admin
 *
 */
@Component
public class ServiceImpl  implements TestService{
		
	@Autowired
	private  ActivityPhotoMapper  	 activityPhotoMapper;

    @Override
    public List<ActivityPhoto> queryList() {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public String insertPhoto(ActivityPhoto ap) throws IllegalStateException, IOException {
        System.out.println("照片名称"+ap.getActivityPhoto()+"长度:"+ap.getActivityPhoto().length());
        System.out.println(ap.getActivityRecordId());
        activityPhotoMapper.insert(ap);
        return "SUCCESS";
    }
    

  

   
	
	

}
