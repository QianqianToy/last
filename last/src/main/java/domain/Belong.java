package domain;

/**
 * TODO()
 * Created by zqq on 2017/7/10 0010.
 */
public class Belong {

    private Integer belongsID;
    private Integer articleID;
    private String articleBigType;
    private String articleSmallType;

    public Integer getBelongsID() {
        return belongsID;
    }

    public void setBelongsID(Integer belongsID) {
        this.belongsID = belongsID;
    }

    public Integer getArticleID() {
        return articleID;
    }

    public void setArticleID(Integer articleID) {
        this.articleID = articleID;
    }

    public String getArticleBigType() {
        return articleBigType;
    }

    public void setArticleBigType(String articleBigType) {
        this.articleBigType = articleBigType;
    }

    public String getArticleSmallType() {
        return articleSmallType;
    }

    public void setArticleSmallType(String articleSmallType) {
        this.articleSmallType = articleSmallType;
    }
}
