package service;

import domain.Complain;
import mapper.ComplainMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * TODO()
 * Created by zqq on 2017/7/15 0015.
 */
@Service
public class ComplainService {

    @Autowired
    private ComplainMapper complainMapper;

    public List<Complain> findComplainAll(int userID){
        return complainMapper.selectComplainAll(userID);
    }
}
