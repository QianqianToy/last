package domain;

import utils.DateUtil;

import java.util.Date;

/**
 * TODO()
 * Created by zqq on 2017/7/11 0011.
 */
public class ArticleAndIcon {

    private String title;
    private String content;
    private Date writeTime;
    private Integer upNum;
    private Integer downNum;
    private Integer flowers;
    private String username;
    private String photo;
    private Integer articleID;
    private Date birthday;
    private String sign;
    private String signature;
    private Integer fansNum;
    private String articleBigType;
    private Integer articleNum;
    private Integer userID;

    public Integer getUserID() {
        return userID;
    }

    public void setUserID(Integer userID) {
        this.userID = userID;
    }

    public Integer getArticleNum() {
        return articleNum;
    }

    public void setArticleNum(Integer articleNum) {
        this.articleNum = articleNum;
    }

    public String getArticleBigType() {
        return articleBigType;
    }

    public void setArticleBigType(String articleBigType) {
        this.articleBigType = articleBigType;
    }

    public Integer getFansNum() {
        return fansNum;
    }

    public void setFansNum(Integer fansNum) {
        this.fansNum = fansNum;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getSign() {
        return sign;
    }

    public void setSign(String sign) {
        this.sign = sign;
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public Integer getArticleID() {
        return articleID;
    }

    public void setArticleID(Integer articleID) {
        this.articleID = articleID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getWriteTime() {
        return writeTime;
    }

    public void setWriteTime(String writeTime) {
//        this.writeTime = writeTime;
        this.writeTime= DateUtil.str2date(writeTime);
    }

    public Integer getUpNum() {
        return upNum;
    }

    public void setUpNum(Integer upNum) {
        this.upNum = upNum;
    }

    public Integer getDownNum() {
        return downNum;
    }

    public void setDownNum(Integer downNum) {
        this.downNum = downNum;
    }

    public Integer getFlowers() {
        return flowers;
    }

    public void setFlowers(Integer flowers) {
        this.flowers = flowers;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

//    public String toString(){
//        Date writeTime = new Date();
//        java.text.DateFormat format = new SimpleDateFormat();
//        String s = format.format(writeTime);
//        return s;
//
//    }
}
