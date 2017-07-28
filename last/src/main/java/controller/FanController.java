package controller;

import domain.ArticleAndIcon;
import domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.FanService;
import service.UserService;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * TODO()
 * Created by zqq on 2017/7/13 0013.
 */
@Controller
public class FanController extends TotalController {

    @Autowired
    private FanService fanService;

    @Autowired
    private UserService userService;

    @RequestMapping("/attention")
    public String attention(ModelMap modelMap,Integer fansNum, Integer authorID, String username, Integer fansID, String userlog,HttpSession session){

        fansNum +=1;
        fanService.attention1(fansID,authorID);//关注时插入fans表
        fanService.attention2(fansNum,authorID);//关注时修改user表

        author(modelMap,username,fansID);//关注后跳回作者页
        modelMap.addAttribute("i","1");
        modelMap.addAttribute("userlog",userlog);

        return "author.jsp";
    }

    @ResponseBody
    @RequestMapping("/selectFansAll")
    public List<ArticleAndIcon> selectFansAll(Integer userID,ModelMap modelMap){

        User user = userService.findById(userID);
        modelMap.addAttribute("user",user);

        List<ArticleAndIcon> list = fanService.findFansAll(user.getUsername());

        return list;
    }

}
