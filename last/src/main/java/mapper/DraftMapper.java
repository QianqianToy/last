package mapper;

import domain.Draft;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * TODO()
 * Created by zqq on 2017/7/15 0015.
 */
public interface DraftMapper {

    @Select("select * from drafts where username =#{param}")
    List<Draft> selectDraftsInfro(String username);

    @Delete("delete from drafts where draftsID =#{draftsID}")
    int deleteByDraftsID(int draftsID);
}
