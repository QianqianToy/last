package domain;

import utils.DateUtil;

import java.util.Date;

/**
 * TODO()
 * Created by zqq on 2017/7/10 0010.
 */
public class Comment {

    private Integer commentID;
    private String comment;
    private Integer userID;
    private Integer floor;
    private Date commentDate;
    private Integer articleID;
    private Integer upNum;
    private String photo;
    private String username;

    public void setCommentDate(Date commentDate) {
        this.commentDate = commentDate;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Integer getCommentID() {
        return commentID;
    }

    public void setCommentID(Integer commentID) {
        this.commentID = commentID;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Integer getUserID() {
        return userID;
    }

    public void setUserID(Integer userID) {
        this.userID = userID;
    }

    public Integer getFloor() {
        return floor;
    }

    public void setFloor(Integer floor) {
        this.floor = floor;
    }

    public Date getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(String commentDate) {
//        this.commentDate = commentDate;
        this.commentDate= DateUtil.str2date(commentDate);
    }

    public Integer getArticleID() {
        return articleID;
    }

    public void setArticleID(Integer articleID) {
        this.articleID = articleID;
    }

    public Integer getUpNum() {
        return upNum;
    }

    public void setUpNum(Integer upNum) {
        this.upNum = upNum;
    }
}
