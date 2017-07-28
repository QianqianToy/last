package domain;

import utils.DateUtil;

import java.util.Date;

/**
 * TODO()
 * Created by zqq on 2017/7/10 0010.
 */
public class Complain {

    private Integer complainID;
    private String complainContent;
    private Date complainDate;
    private Integer userID;
    private String complainArticle;
    private String complainComment;

    public Integer getComplainID() {
        return complainID;
    }

    public void setComplainID(Integer complainID) {
        this.complainID = complainID;
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

    public void setComplainDate(String complainDate) {
//        this.complainDate = complainDate;
        this.complainDate= DateUtil.str2date(complainDate);
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
}
