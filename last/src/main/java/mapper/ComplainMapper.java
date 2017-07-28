package mapper;

import domain.Complain;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * TODO()
 * Created by zqq on 2017/7/15 0015.
 */
public interface ComplainMapper {

    @Select("select * from complains where userID =#{userID}")
    List<Complain> selectComplainAll(int userID);// 根据被投诉人ID查询相关信息
}
