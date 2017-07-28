package service;

import domain.ArticleAndCollectArticle;
import mapper.CollectArticleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * TODO()
 * Created by zqq on 2017/7/15 0015.
 */
@Service
public class CollectArticleService {

    @Autowired
    private CollectArticleMapper collectArticleMapper;

    public List<ArticleAndCollectArticle> findCollectionAll(Integer userID){
        return collectArticleMapper.selectCollectionAll(userID);
    }
}
