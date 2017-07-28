package domain;

/**
 * TODO()
 * Created by zqq on 2017/7/10 0010.
 */
public class CollectArticle {

    private Integer collectID;
    private String title;
    private Integer userID;
    private Integer articleID;

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
}
