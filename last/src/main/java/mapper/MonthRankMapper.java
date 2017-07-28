package mapper;

import domain.Article;
import domain.ArticleUserView;
import domain.ArticleVisition;
import domain.User;
import org.apache.ibatis.annotations.Select;

import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/7/11.
 */
public interface MonthRankMapper {

    @Select("SELECT * FROM articles WHERE articleID in( select DISTINCT articleID from articlevisitions where date BETWEEN #{param1} AND #{param2}) ORDER BY upNum DESC;")
    List<Article> getArticle(Date date1, Date date2);

    //取出每月阅读量的排行榜
    @Select("select DISTINCT articleID from articlevisitions where date BETWEEN #{param1} AND #{param2} GROUP BY articleID ORDER BY count(0) DESC")
    List<ArticleVisition> getArticleID(Date date1, Date date2);

    @Select("Select * from users where username=#{param1}")
    User getUserByName(String username);

    //取出分类数据排行榜
    @Select("select * from articles_user_view where articleBigType=#{param1} and articleSmallType=#{param2} order by upNum Desc")
    List<ArticleUserView> getArticleAndUser(String articleBigType, String articleSmallType);

}
