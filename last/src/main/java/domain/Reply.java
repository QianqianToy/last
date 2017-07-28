package domain;

import java.util.Date;

/**
 * TODO()
 * Created by zqq on 2017/7/10 0010.
 */
public class Reply {

    private Integer replyID;
    private String reply;
    private Integer userID;
    private Integer commentID;
    private Date date;

    public Integer getReplyID() {
        return replyID;
    }

    public void setReplyID(Integer replyID) {
        this.replyID = replyID;
    }

    public String getReply() {
        return reply;
    }

    public void setReply(String reply) {
        this.reply = reply;
    }

    public Integer getUserID() {
        return userID;
    }

    public void setUserID(Integer userID) {
        this.userID = userID;
    }

    public Integer getCommentID() {
        return commentID;
    }

    public void setCommentID(Integer commentID) {
        this.commentID = commentID;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
//        this.date= DateUtil.str2date(date);
    }
}
