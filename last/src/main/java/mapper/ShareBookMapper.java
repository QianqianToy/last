package mapper;

import domain.ShareBook;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * TODO()
 * Created by zqq on 2017/7/14 0014.
 */
public interface ShareBookMapper {

    @Select("SELECT * from sharebooks where username=#{username} order by shareDate")
    List<ShareBook> personalShare(String username);//作者主页的分享

    @Select("select * from sharebooks where userID=#{userID}")
    List<ShareBook> selectShareByUserID(Integer userID);

    @Insert("insert into sharebooks(userID,bookName,bookAuthor,bookIntroduction,picture,articleBigType) " +
            "values(#{userID},#{bookName},#{bookAuthor},#{bookIntroduction},#{picture},#{articleBigType}) ")
    int insertByUserID(ShareBook shareBook);

    @Select("select * from sharebooks where userID =#{userID}")
    List<ShareBook> selectMyShareByUserID(Integer userID);
}
