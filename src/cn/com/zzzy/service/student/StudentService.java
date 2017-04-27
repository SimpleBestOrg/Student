package cn.com.zzzy.service.student;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.zzzy.basemapper.authoritymapper.AuthorityAccountMapper;
import cn.com.zzzy.basemapper.studentmapper.StudentsMapper;
import cn.com.zzzy.entity.AuthorityAccount;
import cn.com.zzzy.entity.Student;
import cn.com.zzzy.service.authority.AuthorityAccountService;
import cn.com.zzzy.util.PageData;
import cn.com.zzzy.util.PageParam;
import cn.com.zzzy.util.PinyingUtil;

@Service
public class StudentService {

    @Autowired
    private StudentsMapper studentMapper;

    @Autowired
    private AuthorityAccountService auAcService;

    /**
     * 根据学生ID查询学生朋友的信息
     * @param param
     * @param stuId  学生ID
     * @return
     */
    public List<Student> queryFriendInfo(PageParam param, Integer stuId) {
        return studentMapper.queryFriendInfo(param, stuId);
    }

    /**
     * 根据学生ID查询学生的详细信息
     * @param stuId
     * @return
     */
    public Student queryStudentInfoById(Integer stuId) {
        return studentMapper.queryStudentInfoById(stuId);
    }

    /**
     * 查询所有学生
     * @return
     */
    public List<Student> queryAllStudent(PageParam param) {
        return studentMapper.queryAllStudent(param);
    }

    /**
     * 查询学生人数
     * @return
     */
    public Integer queryAllStudentCount(PageParam param) {
        return studentMapper.queryAllStudentCount(param);
    }

    /**
     * 前台页面分页用
     * @param param
     * @return
     */
    public PageData queryForPage(PageParam param) {
        return new PageData(queryAllStudentCount(param), queryAllStudent(param));
    }

    /**
     * 添加学生  同时添加学生的登录账户
     * @param student
     */
    public String addStudent(Student student) {
        try {
            studentMapper.addStudent(student);
            String name = student.getStudentName();
            PinyingUtil pinyin = new PinyingUtil();
            String namePinyin = pinyin.hanziToPinyin(name, "");
            AuthorityAccount authorityAccount = new AuthorityAccount();
            authorityAccount.setAccountName(namePinyin);
            authorityAccount.setAccountPwd(namePinyin);
            authorityAccount.setStudentId(student.getStudentId());
            auAcService.insertAuthorityAccount(authorityAccount);
            return "添加成功";
        } catch (Exception e) {
            return "添加失败";
        }
    }
}
