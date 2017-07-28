package service;

import domain.ArticleAndIcon;
import mapper.FanMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * TODO()
 * Created by zqq on 2017/7/13 0013.
 */
@Service
public class FanService {

    @Autowired
    private FanMapper fanMapper;

    public int attention1(Integer fansID,Integer authorID){
        return fanMapper.insertFans(fansID,authorID);
    }//关注时fans表

    public int attention2(Integer num,Integer userID){
        return fanMapper.update(num,userID);
    }//关注时user表

    public List<ArticleAndIcon> findFansAll(String username){
        return fanMapper.selectFansAll(username);
    }
}
