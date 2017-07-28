package mapper;

import domain.ArticleAndCollectArticle;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * TODO()
 * Created by zqq on 2017/7/15 0015.
 */
public interface CollectArticleMapper {

    @Select("select * from article_collectarticle_view where userID=#{userID}")
    List<ArticleAndCollectArticle> selectCollectionAll(Integer userID);
}
