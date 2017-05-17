package cn.com.zzzy.service.question;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.zzzy.basemapper.questionmapper.QuestionTypeMapper;
import cn.com.zzzy.entity.Question;
import cn.com.zzzy.entity.QuestionType;
@Service
public class QuestionTypeService{
	@Autowired
	private  QuestionTypeMapper questionTypeMapper; 
	/**
	 * 查询所以类型
	 * @return
	 */
	public List<QuestionType> selecall() {
	    System.out.println("进来Service");
		 List<QuestionType> list = questionTypeMapper.selecall();
		 
		 return list;
	}
	/**
	 * 根据问题类型查询问题
	 * @param tid
	 * @return
	 */
	public List<Question> selecttype(Integer tid){
		List<Question> list=questionTypeMapper.selecttype(tid);
		System.out.println("这是根据类型id查询 问题标题");
		return list;
	}
}
