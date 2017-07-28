package controller;

import domain.ArticleIcon;
import domain.ArticleUserView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.MonthRankService;
import utils.FiveDayTool;
import utils.MonthTool;

import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/7/11.
 */
@Controller
public class RankController {

    @Autowired
    private MonthRankService monthRankService;

    @RequestMapping("/showMonthRank")
    @ResponseBody
    public List<ArticleIcon> showMonthRank(){//返回月榜

        Date date1= MonthTool.getMonthFirstDay();
        Date date2=MonthTool.getMonthLastDay();

        List<ArticleIcon> list=monthRankService.getArticle(date1,date2);
        System.out.println(list.size());
        return list;
    }

    @RequestMapping("/showMonthRankByMonth")
    @ResponseBody
    public List<ArticleIcon> showMonthRankByMonth(String time){//返回月榜根据月份

        Date date1=MonthTool.getMontnFirstDayByNum(Integer.parseInt(time.substring(0,1)));
        Date date2=MonthTool.getMontnLastDayByNum(Integer.parseInt(time.substring(0,1)));
        List<ArticleIcon> list=monthRankService.getArticle(date1,date2);

        return list;
    }

    @RequestMapping("/showWeekRank")
    @ResponseBody
    public List<ArticleIcon> showWeekRank(){//返回周榜根据

        Date date1= FiveDayTool.getFiveDayFirstByCurr();
        Date date2=FiveDayTool.getFiveDayLastByCurr();
        List<ArticleIcon> list=monthRankService.getArticle(date1,date2);

        return list;
    }

    @RequestMapping("/showWeekRankByMonth")
    @ResponseBody
    public List<ArticleIcon> showWeekRankByMonth(String time){//返回月榜根据

        Date date1=FiveDayTool.getFiveDayFirst(time);
        Date date2=FiveDayTool.getFiveDayLast(time);
        List<ArticleIcon> list=monthRankService.getArticle(date1,date2);

        return list;
    }

    @RequestMapping("/showArticleUserView")//得到分类排行榜
    @ResponseBody
    public List<ArticleUserView> showArticleUserView(String articleBigType,String articleSmallType){

        String str1=articleBigType;
        String str2=articleSmallType;
        if(articleBigType.contains(" ")){
            str1=articleBigType.replace("\n","");
            str1=str1.trim();
            str2=articleSmallType.replace("\n","");
            str2=str2.trim();
        }
        return monthRankService.getArticleUserView(str1,str2);
    }
}
