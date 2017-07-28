package domain;

import utils.DateUtil;

import java.util.Date;

/**
 * TODO()
 * Created by zqq on 2017/7/10 0010.
 */
public class ArticleVisition {

    private Integer ID;
    private Integer articleID;
    private Integer userID;
    private String state;
    private Date date;

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public Integer getArticleID() {
        return articleID;
    }

    public void setArticleID(Integer articleID) {
        this.articleID = articleID;
    }

    public Integer getUserID() {
        return userID;
    }

    public void setUserID(Integer userID) {
        this.userID = userID;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(String date) {
//        this.date = date;
        this.date= DateUtil.str2date(date);
    }
}
