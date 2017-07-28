package controller;

import domain.Complain;
import domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import service.ComplainService;
import service.UserService;

import java.util.List;

/**
 * TODO()
 * Created by zqq on 2017/7/15 0015.
 */
@Controller
public class ComplainController {

    @Autowired
    private ComplainService complainService;

    @Autowired
    private UserService userService;

    @RequestMapping("/selectComplainAll")//个人中心查看投诉
    public String selectComplainAll(ModelMap modelMap, Integer userID){

        User user = userService.findById(userID);
        modelMap.addAttribute("user",user);

        List<Complain> list =complainService.findComplainAll(userID);
        modelMap.addAttribute("Complain",list);

        return "complain.jsp";
    }

}
