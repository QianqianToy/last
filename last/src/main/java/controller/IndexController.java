package controller;

import domain.ArticleAndIcon;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import service.ArticleService;

import java.util.List;

/**
 * TODO()
 * Created by zqq on 2017/7/11 0011.
 */
@Controller
public class IndexController extends TotalController{

    @Autowired
    private ArticleService articleService;

    @RequestMapping("/findIndex")
    public String findNowArticle(ModelMap modelMap){

        System.out.println("主页找文章he热门作者");
        TimeArticle(modelMap);//加载主页前查找到实时文章

        upArticle(modelMap);//加载主页前查找到猜你喜欢

        downArticle(modelMap);//加载主页前查找到0分作文

        IndexAuthor(modelMap);//主页作者

       return "index.jsp";
    }

    @RequestMapping("/readMore")
    public String readMore(ModelMap modelMap,String top){//阅读更多

        System.out.println("1"+","+top);
        TimeArticle(modelMap);//加载主页前查找到实时文章

        readMoreArticle(modelMap);//阅读更多

        upArticle(modelMap);//加载主页前查找到猜你喜欢

        downArticle(modelMap);//加载主页前查找到0分作文

        IndexAuthor(modelMap);//主页作者

        double location=Double.parseDouble(top);
        location=location+350;

        System.out.println(top);

        modelMap.addAttribute("top",location);
        modelMap.addAttribute("flag","1");
        return "index.jsp";
    }

    @RequestMapping("/change1")
    public String change1(ModelMap modelMap,String down){//换0分作文

        modelMap.addAttribute("down",down);
        System.out.println(down);
        TimeArticle(modelMap);//加载主页前查找到实时文章

        upArticle(modelMap);//加载主页前查找到猜你喜欢

        downDown(modelMap);//换一换0分文章

        IndexAuthor(modelMap);//主页作者

        modelMap.addAttribute("flag","2");
        return "index.jsp";
    }

    @RequestMapping("/change2")
    public String change2(ModelMap modelMap,String up){//换喜欢作文

        modelMap.addAttribute("up",up);
        TimeArticle(modelMap);//加载主页前查找到实时文章

        upUp(modelMap);//换一换猜你喜欢

        downArticle(modelMap);//加载主页前查找到0分作文

        IndexAuthor(modelMap);//主页作者
        modelMap.addAttribute("flag","3");

        return "index.jsp";
    }

    @RequestMapping("/indexType")
    public String indexType(ModelMap modelMap,String type) {//根据类型找文章

        List<ArticleAndIcon> timeArticles = articleService.findType(type);
        modelMap.addAttribute("timeArticles", timeArticles);

        upArticle(modelMap);//加载主页前查找到猜你喜欢

        downArticle(modelMap);//加载主页前查找到0分作文

        IndexAuthor(modelMap);//主页作者

        return "index.jsp";
    }

}
