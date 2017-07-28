package service;

import domain.*;
import mapper.MonthRankMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import utils.TimeTool;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/7/11.
 */
@Service
public class MonthRankService {

    @Autowired
    private MonthRankMapper monthRankMapper;

    public List<ArticleIcon> getArticle(Date date1, Date date2){
        List<Article> list1=monthRankMapper.getArticle(date1,date2);
        List<ArticleVisition> list2=monthRankMapper.getArticleID(date1,date2);
        List<Article> list3=new ArrayList<Article>();
        List<ArticleIcon> list4=new ArrayList<ArticleIcon>();
        for(int i=0;i<list2.size();i++){
            for(int j=0;j<list1.size();j++){
                if(list2.get(i).getArticleID()==list1.get(j).getArticleID()){
                    list3.add(list1.get(j));
                    break;
                }
            }
        }
        ArticleIcon articleIcon=null;
        for(int i=0;i<list3.size();i++){
            articleIcon=new ArticleIcon();
            articleIcon.setArticle(list3.get(i));
            User user=monthRankMapper.getUserByName(list3.get(i).getUsername());
            articleIcon.setPhoto(user.getPhoto());
            articleIcon.setWriteTime(TimeTool.DateToString(articleIcon.getArticle().getWriteTime()));
            list4.add(articleIcon);
        }
        return list4;
    }

    public List<ArticleUserView> getArticleUserView(String articleBigType,String articleSmallType){
        return monthRankMapper.getArticleAndUser(articleBigType,articleSmallType);
    }//取出每月阅读量排行榜的文章ID
}
