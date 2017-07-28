package domain;

/**
 * TODO()
 * Created by zqq on 2017/7/10 0010.
 */
public class Fan {

    private Integer fansTableID;
    private String fansName;
    private String authorName;

    public Integer getFansTableID() {
        return fansTableID;
    }

    public void setFansTableID(Integer fansTableID) {
        this.fansTableID = fansTableID;
    }

    public String getFansName() {
        return fansName;
    }

    public void setFansName(String fansName) {
        this.fansName = fansName;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }
}
