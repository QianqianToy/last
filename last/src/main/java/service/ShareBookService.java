package service;

import domain.ShareBook;
import mapper.ShareBookMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * TODO()
 * Created by zqq on 2017/7/14 0014.
 */
@Service
public class ShareBookService {

    @Autowired
    private ShareBookMapper shareBookMapper;

    public List<ShareBook> myShare(String username){
        return shareBookMapper.personalShare(username);
    }//作者主页分享

    public List<ShareBook> findShareByUserID(Integer userID){
        return shareBookMapper.selectShareByUserID(userID);
    }

    @Transactional
    public int addByUserID(ShareBook shareBook){
        return shareBookMapper.insertByUserID(shareBook);
    }

    public List<ShareBook> findMyShareByUserID(Integer userID){
        return shareBookMapper.selectMyShareByUserID(userID);
    }
}
