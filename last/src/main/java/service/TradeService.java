package service;

import domain.ArticleAndUserAndTrade;
import domain.Page;
import mapper.TradeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * TODO()
 * Created by zqq on 2017/7/15 0015.
 */
@Service
public class TradeService {

    @Autowired
    private TradeMapper tradeMapper;

    public List<ArticleAndUserAndTrade> selectTradeInfro(Integer userID){

        List<ArticleAndUserAndTrade> list1=tradeMapper.selectTradeInfro(userID);

        for(int i=0;i<list1.size();i++){
            list1.get(i).setAuthorName((tradeMapper.selectByID(list1.get(i).getAuthorID()).getUsername()));
        }
        return list1;
    }//交易详情

    public List<ArticleAndUserAndTrade> findTradePage(Page page){
        return tradeMapper.selectTradePage(page);
    }

    public int findCountAll(){
        return tradeMapper.selectCountAll();
    }

}
