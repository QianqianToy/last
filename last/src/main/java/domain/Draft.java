package domain;

import java.sql.Date;

/**
 * TODO()
 * Created by zqq on 2017/7/10 0010.
 */
public class Draft {

    private Integer draftsID;
    private String title;
    private String username;
    private Date writeTime;
    private String draftsContent;
    private String articleBigType;
    private String articleSmallType;
    private String photo;

    public Integer getDraftsID() {
        return draftsID;
    }

    public void setDraftsID(Integer draftsID) {
        this.draftsID = draftsID;
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

    public Date getWriteTime() {
        return writeTime;
    }

    public void setWriteTime(Date writeTime) {
        this.writeTime = writeTime;
    }

    public String getDraftsContent() {
        return draftsContent;
    }

    public void setDraftsContent(String draftsContent) {
        this.draftsContent = draftsContent;
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

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }
}
