package controller;

import domain.ArticleAndIcon;
import domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.UserService;
import service.WalletService;

import java.util.List;

/**
 * TODO()
 * Created by zqq on 2017/7/15 0015.
 */
@Controller
public class WalletController {

    @Autowired
    private WalletService walletService;

    @Autowired
    private UserService userService;

    @ResponseBody
    @RequestMapping("/selectWalletInfroAll")//查看我的钱包
    public List<ArticleAndIcon> selectWalletInfroAll(ModelMap modelMap, Integer userID){

        User user = userService.findById(userID);

        modelMap.addAttribute("user",user);

        List<ArticleAndIcon> list = walletService.findWalletInfroAll(user.getUsername());

        modelMap.addAttribute("WalletInfro",list);
        return list;
    }
}
