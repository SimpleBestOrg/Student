package cn.com.zzzy.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import cn.com.zzzy.entity.ActivityPhoto;
/**
 * 测试之后 可以删除
 * @author Admin
 *
 */
public interface TestService {
    List<ActivityPhoto> queryList();
    String  insertPhoto(ActivityPhoto ap) throws IllegalStateException, IOException;
}
