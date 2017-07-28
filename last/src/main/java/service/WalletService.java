package service;

import domain.ArticleAndIcon;
import mapper.WalletMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * TODO()
 * Created by zqq on 2017/7/15 0015.
 */
@Service
public class WalletService {

    @Autowired
    private WalletMapper walletMapper;

    public List<ArticleAndIcon> findWalletInfroAll(String username){
        return walletMapper.selectWalletInfroAll(username);
    }
}
