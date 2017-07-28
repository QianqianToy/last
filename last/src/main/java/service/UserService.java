package service;

import domain.*;
import mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * TODO()
 * Created by zqq on 2017/7/11 0011.
 */
@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;

    public List<User> findAuthor(){
        return userMapper.selectAuthor();
    }//主页热门作者

    public User viewAuthor(String username){
        return userMapper.selectViewAuthor(username);
    }//作者详情页

    public User findByUser(String username,String password){
        return userMapper.findByUser(username,password);
    }//登录查询账号密码

    @Transactional
    public int insertUser(User user){
        return userMapper.insertUser(user);
    }//注册

    public User findById(int userID){
        return userMapper.selectById(userID);
    }

    @Transactional
    public int updateAllById(User user){
        return userMapper.updateById(user);
    }

    @Transactional
    public int insertArticle(Article article){
        return userMapper.insertArticles(article);
    }

    @Transactional
    public  int insertToDrafts(Article article){
        return userMapper.insertToDrafts(article);
    }

    public List<ShareBook> getSelectAll(String name){
        return userMapper.getSelectAllShare(name);
    }//模糊查询

    public User findUser1(int id){
        return userMapper.selectUser1(id);
    }

    public User findUser(String username){
        return userMapper.selectUser(username);
    }//查找用户账号

    public Article findArticle(Integer articleID){
        return userMapper.selectArticle(articleID);
    }//查找文章数据

    public List findCommentNum(Integer articleID){
        return userMapper.selectCommentNum(articleID);
    }//查询评论数量

    @Transactional
    public int findComplainResult(Describe describe){
        return userMapper.complainArticles(describe);
    }//投诉文章

    public int selectID(String username){
        return  userMapper.selectUserID(username);
    }//查询用户id

    public  String selectZanOrNo(int integer1,int integer2){
        return userMapper.voteOrNo(integer1,integer2);
    }//查询是否点过赞、/踩

    public int zan1( int userID,String state,int articleID){
        return userMapper.zan( userID, state, articleID) ;
    }//插入点赞、踩

    public  User exisitService(int integer1,int integer2){
        return userMapper.exist(integer1,integer2);
    }//查询赞表有没有数据

    public int updateZanService(String state,int integer1,int integer2){
        return userMapper.updateZanMapper(state,integer1,integer2);
    }//更新赞表数据

    public int updateZanNum1(int integer1,int integer2 ){
        return userMapper.updateZanNum(integer1,integer2 );
    }//更新赞、踩数量

    public List<Comment>  selectCommentService(Integer integer){
        return userMapper.selectCommentMapper(integer);
    }//查询按日期排序的评论信息

    public int selectFlowerNum (String username){
        return userMapper.selectFlowerNum(username );
    }//查询用户红花数量

    public int updateFlower (int num ,String username){
        return userMapper.updateFlower(num,username);
    }//更新用户红花数量

    public int  recordInsert (Trade trade){
        return userMapper.recordInsert(trade);
    }// 插入红花打赏记录

    public int selectFlower (int authorID){
        return userMapper.selectFlower (authorID);
    }//查询红花记录

    public int InsertCommentService(Comment comment){
        return userMapper.commentInsert(comment);
    }//插入评论

    public int insertCommentVote(CommentVote commentVote){
        return userMapper.commentVoteInsert(commentVote);
    }//插入评论点赞记录

    public String exsitVote(Integer integer,Integer integer1){
        return userMapper.existVote(integer,integer1);
    }//查询点赞记录表有没有该评论点赞记录

    public int updateCommentPosition(String state,int commentID,int userID){
        return userMapper.updateCommentPosition(state,commentID,userID);
    }//更改评论点赞状态

    public int updateCommentNum(int num,int commentID){
        return userMapper.updateCommentNum(num,commentID);
    }//更新评论点赞数

    public int selectCommentVote(int commentID){
        return userMapper.selectCommentVoteNum(commentID);
    } //查询评论点赞数量

    public int insertReply(Reply reply){
        return userMapper.insertReply(reply);
    } //插入回复

    public List<Reply> selectReply(Reply reply){
        return userMapper.selectReply(reply);
    }//查询回复
}
