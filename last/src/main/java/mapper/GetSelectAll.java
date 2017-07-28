package mapper;

/**
 * Created by Administrator on 2017/7/15.
 */
public class GetSelectAll {

    public String selectAll(String name){
        return new StringBuilder().append("SELECT * ")
                .append("FROM sharebooks ")
                .append("WHERE bookName LIKE '%").append(name).append("%' ")
                .append("OR bookAuthor LIKE '%").append(name).append("%' ")
                .toString();

    }
}
