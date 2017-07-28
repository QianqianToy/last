package controller;

import domain.ArticleAndCollectArticle;
import domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import service.CollectArticleService;
import service.UserService;

import java.util.List;

/**
 * TODO()
 * Created by zqq on 2017/7/15 0015.
 */
@Controller
public class CollectArticleController {

    @Autowired
    private CollectArticleService collectArticleService;

    @Autowired
    private UserService userService;

    @RequestMapping("/selectCollectionAll")//个人中心收藏文章
    public String selectAll(ModelMap modelMap,Integer userID){

        User user = userService.findById(userID);
        modelMap.addAttribute("user",user);

        List<ArticleAndCollectArticle> list = collectArticleService.findCollectionAll(userID);
        modelMap.addAttribute("ArticleAndCollectarticle",list);

        return "collectionandfans.jsp";
    }
}
