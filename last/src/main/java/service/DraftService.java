package service;

import domain.Draft;
import mapper.DraftMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * TODO()
 * Created by zqq on 2017/7/15 0015.
 */
@Service
public class DraftService {

    @Autowired
    private DraftMapper draftMapper;

    public List<Draft> findDraftsInfro(String username){
        return draftMapper.selectDraftsInfro(username);
    }

    @Transactional
    public int deleteByDraftsID(int draftsID){
        return draftMapper.deleteByDraftsID(draftsID);
    }
}
