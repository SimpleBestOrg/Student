package cn.com.zzzy.controller.authority;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.com.zzzy.entity.AuthorityAccount;
import cn.com.zzzy.service.authority.AuthorityAccountService;
import cn.com.zzzy.service.authority.AuthorityMenuService;
import cn.com.zzzy.util.AuthorityMenuUtil;

@Controller
public class AuthorityAccountController {

	@Autowired
	private AuthorityAccountService auAcService;
	
	@Autowired
	private AuthorityMenuService auMeService;
	
	
	/**
	 * 登陆验证
	 * @param request
	 * @param vo
	 * @return
	 */
	@RequestMapping("queryAccountLanding")
	public String queryAccountLanding(HttpServletRequest request,AuthorityAccount vo){
	    String loginInfo = "login.jsp";
		try {
			AuthorityAccount account = auAcService.queryAccountLanding(vo);
			
			if(account!=null){
			    request.getSession().setAttribute("Account", account);
				if(account.getStudentId() != null  && account.getStudentId() != 0){
				     return "redirect:queryStudentInfoById.action";
				}else if(account.getTeacherId()!=null && account.getTeacherId() != 0){
				     return  "redirect:back/backindex.jsp";
				}else{
				    request.setAttribute("loginMsg", 1);
				    return loginInfo; 
				}
			}else{
			    request.setAttribute("loginMsg", 1);
				return loginInfo;
			}
		} catch (Exception e) {
		    request.setAttribute("loginMsg", 1);
			return loginInfo;
		}
	}
	
	

	/**
	 * 查询老师、学生及Accid
	 * @param request
	 * @param id
	 * @param rows
	 * @param page
	 * @return
	 */
	@RequestMapping("queryAccountTeaStu")
	@ResponseBody
	public Object queryAccountTeaStu(HttpServletRequest request,Integer id,Integer rows,Integer page){

		return auAcService.queryAccountTeaStu(id,request.getParameter("value"),rows,page);
	}
	
	/**
	 * 根据登陆的用户查询菜单   若登陆用户则查询出相应的菜单  否则  就返回一个 空 的list  数组
	 * （若页面接收到null的数组集合 则使其跳转到登陆页面   --功能在页面实现）
	 * @param request
	 * @return
	 */
	@RequestMapping("queryAccountMenu")
	@ResponseBody
	public List<AuthorityMenuUtil> queryAccountMenu(HttpServletRequest request){
		try {
			AuthorityAccount account = (AuthorityAccount) request.getSession().getAttribute("Account");
			return auMeService.queryAccountMenu(account.getAccountId());
		} catch (Exception e) {
			List<AuthorityMenuUtil> list = new ArrayList<AuthorityMenuUtil>();
			return list;
		}
	}
	
    	/**
    	 * 查询学生密码
    	 * @param stuId
    	 * @return
    	 */
		public ModelAndView selectStudentPwd(Integer stuId){
	    ModelAndView mv = new ModelAndView();
	    String StudentPwd= auAcService.selectStudentPwd(stuId);
	    mv.addObject("StudentPwd", StudentPwd);
	    mv.setViewName("/front/user/set.jsp");
	    return mv;
	}
	
    /**
     * 
     * @param session
     * @param studentPwd
     * @param stuId
     * @return
     */
	@RequestMapping("updateStudentPwd")
	public String updateStudentPwd(HttpSession session,String studentPwd,Integer stuId){
	    stuId=(Integer)session.getAttribute("stuId");
	    auAcService.updateStudentPwd(studentPwd, stuId);
	    System.out.println("修改密码："+stuId);
	    return "redirect:queryStudentInfoById.action?stuId="+stuId;
	}
}
