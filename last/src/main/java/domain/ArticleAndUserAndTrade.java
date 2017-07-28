package domain;

import utils.DateUtil;

import java.util.Date;

/**
 * TODO()
 * Created by zqq on 2017/7/15 0015.
 */
public class ArticleAndUserAndTrade {

    private Date tradeTime;
    private Integer tradeFlowers;
    private String username;
    private Integer authorID;
    private Integer articleID;
    private Integer userID;
    private String title;
    private String authorName;
    private String tradeTime2;

    public void setTradeTime(Date tradeTime) {
        this.tradeTime = tradeTime;
    }

    public String getTradeTime2() {
        return tradeTime2;
    }

    public void setTradeTime2(String tradeTime2) {
        this.tradeTime2 = tradeTime2;
    }

    public Date getTradeTime() {
        return tradeTime;
    }

    public void setTradeTime(String tradeTime) {
        this.tradeTime= DateUtil.str2date(tradeTime);
    }

    public Integer getTradeFlowers() {
        return tradeFlowers;
    }

    public void setTradeFlowers(Integer tradeFlowers) {
        this.tradeFlowers = tradeFlowers;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Integer getAuthorID() {
        return authorID;
    }

    public void setAuthorID(Integer authorID) {
        this.authorID = authorID;
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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }
}
