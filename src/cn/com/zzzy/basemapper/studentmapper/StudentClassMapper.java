package cn.com.zzzy.basemapper.studentmapper;

import java.util.List;

import cn.com.zzzy.entity.StudentClasses;

public interface StudentClassMapper {
        
        /**
         * 查询所有班级
         * @return
         */
        List<StudentClasses> queryAllClasses();
        
}
