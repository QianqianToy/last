package mapper;

import domain.*;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;

import java.util.List;

/**
 * TODO()
 * Created by zqq on 2017/7/11 0011.
 */
public interface UserMapper {

    @Select("SELECT * FROM users ORDER BY fansNum DESC;")
    List<User> selectAuthor();//主页选取热门作者

    @Select("select * from users where username=#{username}")
    User selectViewAuthor(String username);//查看作者详情

    @Select("select * from users where userID =#{param1}")
    User selectById(int userID);//根据ID查询名字

    @Update("update users set username=#{username},password=#{password}," +
            "birthday=#{birthday},sign=#{sign},phone=#{phone}," +
            "email=#{email},photo=#{photo},signature=#{signature} where userID=#{userID}" )
    int updateById(User user);// 根据ID修改信息

    @Select("SELECT * FROM users WHERE username=#{param1} AND password=#{param2}")
    User findByUser(String username, String password);//登录

    @Insert("INSERT INTO users(username,password,birthday,sign,phone,email)values(#{username},#{password},#{birthday},#{sign},#{phone},#{email})")
    int insertUser(User user);//注册

    @Insert("INSERT INTO articles(title,username,writeTime,content,articleBigType,articleSmallType)values(#{title},#{username},#{writeTime},#{content},#{articleBigType},#{articleSmallType})")
    int insertArticles(Article article);//增加文章

    @Insert("INSERT INTO drafts(title,username,writeTime,draftsContent,articleBigType,articleSmallType)values(#{title},#{username},#{writeTime},#{content},#{articleBigType},#{articleSmallType})")
    int insertToDrafts(Article article);//保存文章到草稿箱

    @SelectProvider(type = GetSelectAll.class,method = "selectAll")
    List<ShareBook> getSelectAllShare(String name);//共享文章页面模糊查询

    @Select("SELECT * FROM users WHERE  userID=#{param1}")
    User selectUser1(int id);

    @Select("SELECT * FROM users WHERE  username=#{param1}")
    User selectUser(String username);//查找用户账号

    @Select("SELECT * FROM articles WHERE articleID=#{param1}")
    Article selectArticle(Integer articleID);//查找文章数据

    @Select("SELECT floor FROM comments WHERE articleID=1")
    List<String> selectCommentNum(Integer articleID);//查找评论数量

    @Insert("INSERT INTO complains(complainContent,complainDate,userID,complainArticle,complainComment) values(#{complainContent},#{complainDate},#{userID},#{complainArticle},null)")
    int complainArticles(Describe describe);//投诉文章

    @Select("SELECT userID from users WHERE username=#{parm1}")
    int selectUserID(String username);//查询用户id

    @Select("select state from commentvotes where articleID=#{param1} and userID=#{param2}")
    String voteOrNo(int integer1,int integer2);//查询是否点过赞/踩

    @Insert("INSERT INTO commentvotes(commentID,userID,state,articleID) values(null,#{param1},#{param2},#{param3})")
    int zan( int userID,String state,int articleID);//cha插入点赞、踩

    @Select("select * from commentvotes where articleID=#{param1} and userID=#{param2}")
    User exist(int integer1,int integer2);//查询赞表有没有数据

    @Update("update  commentvotes set state =#{param1} where articleID=#{param2} and userID=#{param3}")
    int updateZanMapper(String state,int integer1,int integer2);//更新赞表数据

    @Update("update  articles  set upNum =(select count(state) from commentvotes where articleID=#{param1}  group by state having state='赞')," +
            "downNum =(select count(state) from commentvotes where articleID=#{param1}  group by state having state='踩')" +" "+
            " where articleID=#{param2} ")
    int updateZanNum(int integer1,int integer2 );//更新赞/踩数量

    @Select("select * from comments where articleID=#{param1} ORDER BY floor desc")
    List<Comment> selectCommentMapper(Integer integer);//查询一篇文章的所有评论信息

    @Select("select wallet from users  where username=#{param1} ")
    int selectFlowerNum(String username);//查询用户红花数量

    @Update("update users  set wallet=#{param1} where username=#{param2}")
    int updateFlower (int num,String username);//更新用户红花数量

    @Insert("insert into trades(tradeTime,userID,articleID,authorID,tradeFlowers) values(#{tradeTime},#{userID},#{articleID},#{authorID},#{tradeFlowers})")
    int  recordInsert (Trade trade);// 插入红花打赏记录

    @Select("select count(tradeFlowers) from trades  where article=#{param1} ")
    int selectFlower (int authorID);//cha查询红花记录

    @Insert("insert into comments(comment,userID,floor,commentDate,articleID,upNum,photo,username) values(#{comment},#{userID},#{floor},#{commentDate},#{articleID},#{upNum},#{photo},#{username})")
    int  commentInsert (Comment comment);//插入评论

    @Insert("INSERT INTO commentvotes(commentID,userID,state,articleID) values(#{commentID},#{userID},#{state},null)")
    int  commentVoteInsert (CommentVote commentVote);//插入评论点赞记录

    @Select("select state from commentvotes where commentID=#{param1} and userID=#{param2}")
    String existVote(int integer1,int integer2);//查询点赞记录表有没有该评论点赞记录

    @Update("update commentvotes set state =#{param1} where commentID =#{param2} and userID=#{param3}")
    int updateCommentPosition(String state,int commentID,int userID);//更改评论点赞状态

    @Update("update comments set upNum=#{param1} where commentID=#{param2}")
    int updateCommentNum(int num,int commentID);//更新评论点赞数

    @Select("select upNum from comments where commentID=#{param1} ")
    int selectCommentVoteNum(int commentID);//查询评论点赞数量

    @Insert("INSERT INTO replys(reply,userID,commentID,date) values(#{reply},#{userID},#{commentID},#{date})")
    int insertReply(Reply reply);//插入回复

    @Select("select * from replys where userID=#{userID} and commentID=#{commentID}")
    List<Reply> selectReply(Reply reply);//查询回复
}
