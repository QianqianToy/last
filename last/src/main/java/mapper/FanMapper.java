package mapper;

import domain.ArticleAndIcon;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

/**
 * TODO()
 * Created by zqq on 2017/7/13 0013.
 */
public interface FanMapper {

    @Insert("Insert into fans(fansID,authorID) values(#{param1},#{param2})")
    int insertFans(Integer fansID, Integer authorID);//关注是插入fans表

    @Update("UPDATE users set fansNum =#{param1} where userID=#{param2}")
    int update(Integer num, Integer userID);//关注时修改user表

    @Select("select username,photo,fansNum,count(articleID) as articleNum " +
            "from article_user_view " +
            "where username= #{username} " +
            "group by username")
    List<ArticleAndIcon> selectFansAll(String username);//我的关注
}
