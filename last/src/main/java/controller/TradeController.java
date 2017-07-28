package controller;

import domain.ArticleAndUserAndTrade;
import domain.Page;
import domain.User;
import mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.TradeService;
import service.UserService;

import java.text.SimpleDateFormat;
import java.util.List;

/**
 * TODO()
 * Created by zqq on 2017/7/15 0015.
 */
@Controller
public class TradeController {

    @Autowired
    private TradeService tradeService;

    @Autowired
    private UserService userService;

    @Autowired
    private UserMapper userMapper;

    @RequestMapping("/selectTradeInfroAll")//交易详情
    public String findTradeInfro(ModelMap modelMap, Integer userID){

        User user = userService.findById(userID);

        modelMap.addAttribute("user",user);

        List<ArticleAndUserAndTrade> list = tradeService.selectTradeInfro(userID);
        modelMap.addAttribute("Trade",list);

        return "wallet.jsp";
    }

    @ResponseBody
    @RequestMapping("/selectTradePage")//分页
    public List<ArticleAndUserAndTrade> selectTradePage(Page page){

        page.setPageIndex(page.getPageIndex()*page.getPageSize());
        List<ArticleAndUserAndTrade> list = tradeService.findTradePage(page);
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date="";

        for (int i=0;i<list.size();i++){
            date=sdf.format(list.get(i).getTradeTime());
            User user=userMapper.selectById(list.get(i).getAuthorID());
            list.get(i).setTradeTime2(date);
            list.get(i).setAuthorName(user.getUsername());
            System.out.println(list.get(i).getAuthorName());
        }
        return list;
    }

    @ResponseBody
    @RequestMapping("/selectCountAll")
    public String selectCountAll(){
        Integer pageIndex = (int)Math.ceil((float)tradeService.findCountAll()/(new Page().getPageSize()));
        return pageIndex.toString();
    }

}
