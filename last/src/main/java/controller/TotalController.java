package controller;

import domain.ArticleAndIcon;
import domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import service.ArticleService;
import service.UserService;

import java.util.List;

/**
 * TODO()
 * Created by zqq on 2017/7/14 0014.
 */
@Controller
public class TotalController {

    @Autowired
    private UserService userService;

    @Autowired
    private ArticleService articleService;

    public ModelMap IndexAuthor(ModelMap modelMap){
        List<User> hotAuthors = userService.findAuthor();
        return modelMap.addAttribute("hotAuthors",hotAuthors);
    }//加载主页前查找热门作者

    public ModelMap TimeArticle(ModelMap modelMap){
        List<ArticleAndIcon> timeArticles = articleService.findArticle();
        return modelMap.addAttribute("timeArticles",timeArticles);
    }//加载主页前查找到实时文章

    public ModelMap upArticle(ModelMap modelMap){
        List<ArticleAndIcon> upArticles = articleService.findUpArticle();
        return modelMap.addAttribute("upArticles",upArticles);
    }//加载主页前查找到猜你喜欢

    public ModelMap downArticle(ModelMap modelMap){
        List<ArticleAndIcon> downArticles = articleService.findDownArticle();
        return modelMap.addAttribute("downArticles",downArticles);
    }//加载主页前查找到0分作文

    static int count;//阅读更多
    public ModelMap readMoreArticle(ModelMap modelMap){
        List<ArticleAndIcon> moreArticles = articleService.findReadMore(++count);
        return modelMap.addAttribute("moreArticles",moreArticles);
    }

    static int num1;//换一换0分作文
    public ModelMap downDown(ModelMap modelMap){
        num1=num1+2;
        List<ArticleAndIcon> downArticles = articleService.changeDown(num1);
        return modelMap.addAttribute("downArticles",downArticles);
    }

    static int num2;//换一换猜你喜欢
    public ModelMap upUp(ModelMap modelMap){
        num2=num2+2;
        List<ArticleAndIcon> upArticles = articleService.changeUp(num2);
        return modelMap.addAttribute("upArticles",upArticles);
    }

    public ModelMap author(ModelMap modelMap, String username, Integer userlog){//作者主页需要信息

        User viewAuthors = userService.viewAuthor(username);//查看个人信息
        modelMap.addAttribute("viewAuthors",viewAuthors);

        List<ArticleAndIcon> viewArticles = articleService.findMyArticle(username);
        modelMap.addAttribute("viewArticles",viewArticles);//查看文章

        return modelMap;
    }
}
