package service;

import domain.Article;
import domain.ArticleAndIcon;
import mapper.ArticleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * TODO()
 * Created by zqq on 2017/7/10 0010.
 */
@Service
public class ArticleService {

    @Autowired
    private ArticleMapper articleMapper;

    public List<ArticleAndIcon> findArticle(){
        return articleMapper.selectArticle();
    }//主页实时文章

    public List<ArticleAndIcon> findDownArticle(){
        return articleMapper.selectDownArticle();
    }//0分文章

    public List<ArticleAndIcon> changeDown(Integer num1){
        return articleMapper.changeDownArticle(num1);
    }//换一换0分文章

    public List<ArticleAndIcon> changeUp(Integer num2){
        return articleMapper.changeUpArticle(num2);
    }//换一换猜你喜欢

    public List<ArticleAndIcon> findUpArticle(){
        return articleMapper.selectUpArticle();
    }//猜你喜欢

    public List<ArticleAndIcon> findReadMore(Integer count){
        return articleMapper.selectReadMore(count);
    }//阅读更多

    public List<ArticleAndIcon> findMyArticle(String usename){
        return articleMapper.selectMyArticle(usename);
    }//根据姓名查找文章，用于作者详情页

    public List<ArticleAndIcon> findType(String type){
        return articleMapper.selectType(type);
    }//主页根据分类选择文章

    public List<Article> findAllByUsername(String username){
        return articleMapper.selectAllByUsername(username);
    }

    @Transactional
    public int deleteByArticleID(Integer articleID){
        return articleMapper.deleteByArticleID(articleID);
    }//删除文章

    public  List<String> collectTypes(Integer userID){
        List<String> collectTypes = articleMapper.collectArticleType(userID);
        return collectTypes;
    }//根据用户ID查看收藏了什么类型的文章


    public List<ArticleAndIcon> loginUpArticle(Integer userID){
        List<ArticleAndIcon> list = new ArrayList<ArticleAndIcon>();
        for (String s: collectTypes(userID)) {
            list = articleMapper.selectLoginArticle(s);
        }
        return list;
    }//登录后的猜你喜欢

}
