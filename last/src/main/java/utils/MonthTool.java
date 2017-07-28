package utils;


import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by Administrator on 2017/7/12.
 */
public class MonthTool {

    public static Date getMonthFirstDay() {

        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.DAY_OF_MONTH, calendar
                .getActualMinimum(Calendar.DAY_OF_MONTH));
        SimpleDateFormat simpleFormate = new SimpleDateFormat("yyyy-MM-dd");
        return calendar.getTime();
    }

    public static Date getMonthLastDay() {

        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.DAY_OF_MONTH, calendar
                .getActualMaximum(Calendar.DAY_OF_MONTH));
        SimpleDateFormat simpleFormate = new SimpleDateFormat("yyyy-MM-dd");
        return calendar.getTime();
    }

    public static Date getMontnLastDayByNum(int time){

        Calendar calendar=Calendar.getInstance();
        int currentyear=calendar.get(calendar.YEAR);
        int lastday=0;
        switch (time){
            case 1:lastday=31;
                    break;
            case 2:if(currentyear%4==0){
                        lastday=29;
                    }
                    lastday=28;
                    break;
            case 3:lastday=31;break;
            case 4:lastday=30;break;
            case 5:lastday=31;break;
            case 6:lastday=30;break;
            case 7:lastday=31;break;
            case 8:lastday=31;break;
            case 9:lastday=30;break;
            case 10:lastday=31;break;
            case 11:lastday=30;break;
            case 12:lastday=31;break;
        }
        calendar.set(currentyear,time-1,lastday,23,59,59);
        return calendar.getTime();
    }

    public static Date getMontnFirstDayByNum(int time){
        Calendar calendar=Calendar.getInstance();
        int currentyear=calendar.get(calendar.YEAR);
        int lastday=0;
        calendar.set(currentyear,time-1,1,0,0,0);
        return calendar.getTime();
    }

}
