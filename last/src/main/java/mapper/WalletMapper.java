package mapper;

import domain.ArticleAndIcon;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * TODO()
 * Created by zqq on 2017/7/15 0015.
 */
public interface WalletMapper {

    @Select("select username,photo,fansNum,flowers,signature,count(articleID) as articleNum " +
            "from article_user_view " +
            "where username= #{username} " +
            "group by username")
     List<ArticleAndIcon> selectWalletInfroAll(String username);
}
