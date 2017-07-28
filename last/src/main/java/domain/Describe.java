package domain;

import java.util.Date;

/**
 * Created by Administrator on 2017-07-12.
 */
public class Describe {
    private Article article;
    private Integer commentNum;
    private String timeWrite;
    private User user;
    private String complainContent;
    private Date complainDate;
    private Integer userID;
    private String complainArticle;
    private String complainComment;
    private String state;
    private String result;
    private Comment comment;
    private Reply reply;

    public Reply getReply() {
        return reply;
    }

    public void setReply(Reply reply) {
        this.reply = reply;
    }

    public Comment getComment() {
        return comment;
    }

    public void setComment(Comment comment) {
        this.comment = comment;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getComplainContent() {
        return complainContent;
    }

    public void setComplainContent(String complainContent) {
        this.complainContent = complainContent;
    }

    public Date getComplainDate() {
        return complainDate;
    }

    public void setComplainDate(Date complainDate) {
        this.complainDate = complainDate;
    }

    public Integer getUserID() {
        return userID;
    }

    public void setUserID(Integer userID) {
        this.userID = userID;
    }

    public String getComplainArticle() {
        return complainArticle;
    }

    public void setComplainArticle(String complainArticle) {
        this.complainArticle = complainArticle;
    }

    public String getComplainComment() {
        return complainComment;
    }

    public void setComplainComment(String complainComment) {
        this.complainComment = complainComment;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getTimeWrite() {
        return timeWrite;
    }

    public void setTimeWrite(String timeWrite) {
        this.timeWrite = timeWrite;
    }

    public Integer getCommentNum() {
        return commentNum;
    }

    public void setCommentNum(Integer commentNum) {
        this.commentNum = commentNum;
    }

    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }
}
