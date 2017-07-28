package domain;

import java.util.Date;

/**
 * TODO()
 * Created by zqq on 2017/7/15 0015.
 */
public class Trade {

    private Integer tradeID;
    private Date tradeTime;
    private Integer userID;
    private Integer articleID;
    private Integer authorID;
    private Integer tradeFlowers;

    public Integer getTradeID() {
        return tradeID;
    }

    public void setTradeID(Integer tradeID) {
        this.tradeID = tradeID;
    }

    public Date getTradeTime() {
        return tradeTime;
    }

    public void setTradeTime(Date tradeTime) {
        this.tradeTime = tradeTime;
//        this.tradeTime= DateUtil.str2date(tradeTime);
    }

    public Integer getUserID() {
        return userID;
    }

    public void setUserID(Integer userID) {
        this.userID = userID;
    }

    public Integer getArticleID() {
        return articleID;
    }

    public void setArticleID(Integer articleID) {
        this.articleID = articleID;
    }

    public Integer getAuthorID() {
        return authorID;
    }

    public void setAuthorID(Integer authorID) {
        this.authorID = authorID;
    }

    public Integer getTradeFlowers() {
        return tradeFlowers;
    }

    public void setTradeFlowers(Integer tradeFlowers) {
        this.tradeFlowers = tradeFlowers;
    }
}
