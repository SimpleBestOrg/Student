package cn.com.zzzy.service.question;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.zzzy.basemapper.questionmapper.QuestionTuCaoMapper;

@Service
public class QuestionTuCaoService {
	@Autowired
	private QuestionTuCaoMapper questionTuCaoMapper;
	public List select(Integer qid){
		List list=questionTuCaoMapper.select(qid);
		return list;
	}
	public void delete(Integer qid){
		if(qid!=null){
			questionTuCaoMapper.delete(qid);
		}else{
			System.out.println("你的问题还没有人吐槽");
		}
	}
}
