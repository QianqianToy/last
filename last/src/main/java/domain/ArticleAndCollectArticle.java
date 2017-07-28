package domain;

/**
 * TODO()
 * Created by zqq on 2017/7/15 0015.
 */
public class ArticleAndCollectArticle {

    private Integer collectID;
    private String title;
    private String username;
    private Integer upNum;
    private Integer downNum;
    private Integer flowers;
    private Integer articleID;
    private Integer userID;
    private String articleBigType;

    public String getArticleBigType() {
        return articleBigType;
    }

    public void setArticleBigType(String articleBigType) {
        this.articleBigType = articleBigType;
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

    public Integer getFlowers() {
        return flowers;
    }

    public void setFlowers(Integer flowers) {
        this.flowers = flowers;
    }

    public Integer getCollectID() {
        return collectID;
    }

    public void setCollectID(Integer collectID) {
        this.collectID = collectID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
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

}
