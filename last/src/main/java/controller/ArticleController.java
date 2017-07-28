package controller;

import domain.Article;
import domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import service.ArticleService;
import service.UserService;

import java.util.List;

/**
 * TODO()
 * Created by zqq on 2017/7/15 0015.
 */
@Controller
public class ArticleController {

    @Autowired
    private ArticleService articleService;

    @Autowired
    private UserService userService;

    @RequestMapping("/selectAllByUsername")//根据姓名查询文章列表
    public String findAllByUsername(ModelMap modelMap,Integer userID) {

        User user = userService.findById(userID);
        modelMap.addAttribute("user",user);

        List<Article> list = articleService.findAllByUsername(user.getUsername());
        modelMap.addAttribute("Article",list);

        return "article.jsp";
    }

    @RequestMapping("/deleteByArticleID")//删除文章
    public String deleteByArticleID(Integer articleID, Integer userID,ModelMap modelMap){

        articleService.deleteByArticleID(articleID);

        User user = userService.findById(userID);
        modelMap.addAttribute("user",user);

        List<Article> list = articleService.findAllByUsername(user.getUsername());
        modelMap.addAttribute("Article",list);

        return "article.jsp";
    }
}
