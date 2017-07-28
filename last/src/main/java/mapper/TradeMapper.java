package mapper;

import domain.ArticleAndUserAndTrade;
import domain.Page;
import domain.User;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * TODO()
 * Created by zqq on 2017/7/15 0015.
 */
public interface TradeMapper {

    @Select("select authorID,tradeTime,tradeFlowers,username,title,userID " +
            "from article_user_trade_view " +
            "where userID = #{param1} or authorID = #{param1} ")
    List<ArticleAndUserAndTrade> selectTradeInfro(Integer userID);//交易详情


    @Select("select * from users where userID=#{param1}")
    User selectByID(int userID);

    @Select("select * from users where username =#{param1}")
    User selectByUsername(String username);

    @Select("select authorID,tradeTime,tradeFlowers,username,userID " +
            "from article_user_trade_view " +
            "where authorID = #{param1}")
    List<ArticleAndUserAndTrade> selectByAuthorID(int authorID);

    @Select("select authorID,tradeTime,tradeFlowers,username " +
            "from article_user_trade_view " +
            "limit #{pageIndex},#{pageSize}")
     List<ArticleAndUserAndTrade> selectTradePage(Page page);

    @Select("select count(*) from " +
            "article_user_trade_view")
     int selectCountAll();//查询所有行数

}
