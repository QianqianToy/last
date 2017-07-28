package controller;

import domain.Draft;
import domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import service.DraftService;
import service.UserService;

import java.util.List;

/**
 * TODO()
 * Created by zqq on 2017/7/15 0015.
 */
@Controller
public class DraftController {

    @Autowired
    private DraftService draftService;

    @Autowired
    private UserService userService;

    @RequestMapping("/selectDraftsInfro")//个人中心查看草稿箱
    public String selectDraftsInfro(ModelMap modelMap,Integer userID){

        User user = userService.findById(userID);
        modelMap.addAttribute("user",user);

        List<Draft> list = draftService.findDraftsInfro(user.getUsername());
        modelMap.addAttribute("Drafts",list);

        return "drafts.jsp";
    }

    @RequestMapping("/deleteByDraftsID")//删除草稿
    public String deleteByDraftsID(ModelMap modelMap, Integer userID, Integer draftsID){

        User user = userService.findById(userID);
        modelMap.addAttribute("user",user);

        draftService.deleteByDraftsID(draftsID);

        List<Draft> list = draftService.findDraftsInfro(user.getUsername());
        modelMap.addAttribute("Drafts",list);

        return "drafts.jsp";
    }

}
