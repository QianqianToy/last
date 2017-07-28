package mapper;

import domain.Article;
import domain.ArticleAndIcon;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * TODO()
 * Created by zqq on 2017/7/10 0010.
 */
public interface ArticleMapper {

    @Select("SELECT * FROM article_user_view Where DATE_SUB(CURDATE(), INTERVAL 1 DAY) <=date(writeTime)\n" +
            "order by writeTime DESC")
    List<ArticleAndIcon> selectArticle();//主页面实时文章

    @Select("SELECT *\n" +
            "FROM article_user_view\n" +
            "Where DATE_SUB(CURDATE(), INTERVAL 3 DAY) <=date(writeTime)\n" +
            "order by downNum DESC;")
    List<ArticleAndIcon> selectDownArticle();//0分文章

    @Select("SELECT * FROM article_user_view order by downNum DESC LIMIT #{param1},2;")
    List<ArticleAndIcon> changeDownArticle(Integer num1);//换一换0分文章

    @Select("SELECT *\n" +
            "FROM article_user_view\n" +
            "Where DATE_SUB(CURDATE(), INTERVAL 3 DAY) <=date(writeTime)\n" +
            "order by upNum DESC;")
    List<ArticleAndIcon> selectUpArticle();//猜你喜欢

    @Select("SELECT * FROM article_user_view order by upNum DESC LIMIT #{param1},2;")
    List<ArticleAndIcon> changeUpArticle(Integer num2);//换一换猜你喜欢

    @Select("SELECT articleBigType FROM article_collectarticle_view WHERE userID=#{userID}")
    List<String> collectArticleType(Integer userID);//收藏文章类型

    @Select("SELECT * FROM article_user_view WHERE articleBigType=#{articleBigType} order by upNum DESC;")
    List<ArticleAndIcon> selectLoginArticle(String articleBigType);//登陆后猜你喜欢

    @Select("SELECT * FROM article_user_view WHERE articleBigType=#{articleBigType} order by upNum DESC LIMIT #{param1},2; ")
    List<ArticleAndIcon> changeLoginArticle(Integer num2);//登陆后换一换

    @Select("SELECT * FROM article_user_view\n" +
            "WHERE writeTime<curdate()\n" +
            "order by writeTime DESC LIMIT 0,#{param1} ")
    List<ArticleAndIcon> selectReadMore(Integer count);//阅读更多

    @Select("select * from articles where username=#{username};")
    List<ArticleAndIcon> selectMyArticle(String username);//主页根据作者查询文章

    @Select("select * from article_user_view where articleBigType=#{articleBigType};")
    List<ArticleAndIcon> selectType(String type);//主页根据分类选择文章

    @Select("select articleID,title,writeTime,upNum,downNum,flowers from articles where username =#{username}")
    List<Article> selectAllByUsername(String username);//根据作者名字查询信息

    @Delete("delete from articles where articleID = #{articleID}")
    int deleteByArticleID(Integer articleID);//个人中心的删除文章

}
