package cn.com.zzzy.controller.community;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.com.zzzy.entity.Community;
import cn.com.zzzy.entity.CommunityVo;
import cn.com.zzzy.service.community.CommunityService;

@Controller
public class CommunityController {
    @Autowired
    private CommunityService communityService;

    /**
     * 查询所有的社团
     * @param communityVo
     * @param id
     * @return
     */
    @RequestMapping("getAllCommunity")
    public ModelAndView getAllCommunity(CommunityVo communityVo, Integer id, HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        List<Community> listCommunity = communityService.select(communityVo);
        mv.addObject("listCommunity", listCommunity);
        mv.setViewName("/front/community/communityindex.jsp");
        return mv;
    }

    /**
     * 根据社团的ID来查询出来详细信息
     * @param id
     * @return
     */
    @RequestMapping("getCommunity")
    public ModelAndView getCommunity(Integer id) {
        ModelAndView mv = new ModelAndView();

        mv.addObject("listCommunity", communityService.selectById(id));
        mv.setViewName("/front/community/communitydetail.jsp");
        return mv;
    }

    /**
     * 添加社团
     * @param model
     * @param communityVo
     * @return
     */
    @RequestMapping("InsertCommunity")
    public String InsertCommunity(Model model, CommunityVo communityVo) {

        communityService.insert(communityVo);
        // 重定向
        return "redirect:getAllCommunity.action";
    }

    @RequestMapping("insertPhoto")
    @ResponseBody
    public String insertPhoto() {
        return "成功";
    }
}
