package utils;

import java.util.Calendar;
import java.util.Date;

/**
 * Created by Administrator on 2017/7/14.
 */
public class FiveDayTool {

    public static Date getFiveDayFirst(String time){//根据界面的值获取当前五天的第一天

        String[] str1=time.split("-");
        String[] str2=str1[0].split("\\.");

        Calendar calendar=Calendar.getInstance();
        int currentyear=calendar.get(Calendar.YEAR);
        System.out.println(currentyear);
        int month=Integer.parseInt(str2[0]);
        int day=Integer.parseInt(str2[1]);
        calendar.set(currentyear,month-1,day,0,0,0);

        return calendar.getTime();
    }

    public static Date getFiveDayLast(String time){//根据界面的值获取当前五天的最后一天

        String[] str1=time.split("-");
        String[] str2=str1[1].split("\\.");
        Calendar calendar=Calendar.getInstance();
        int currentyear=calendar.get(Calendar.YEAR);
        int month=Integer.parseInt(str2[0]);
        int day=Integer.parseInt(str2[1]);
        calendar.set(currentyear,month-1,day,23,59,59);
        return calendar.getTime();
    }

    public static Date getFiveDayFirstByCurr() {//根据当前时间获取前五天的第一天
        Calendar calendar = Calendar.getInstance();
        int currentyear=calendar.get(Calendar.YEAR);
        int currentmonth=calendar.get(Calendar.MONTH)+1;
        System.out.println(currentmonth);
        int currentday=calendar.get(Calendar.DAY_OF_MONTH);
        if(currentday==calendar.getActualMaximum(Calendar.DAY_OF_MONTH)){
            currentday=20;
            calendar.set(currentyear,currentmonth-1,currentday,0,0,0);
            return calendar.getTime();
        }
        int consult=currentday/5;
        if(consult==0){
            currentmonth=currentmonth-1;
            calendar.set(currentyear,currentmonth-1,26,0,0,0);
            return calendar.getTime();
        }
        int residue=currentday%5;
        currentday=currentday-residue-4;
        calendar.set(currentyear,currentmonth-1,currentday,0,0,0);
        return calendar.getTime();
    }

    public static Date getFiveDayLastByCurr(){//根据当前时间获取前五天的最后一天
        Calendar calendar=Calendar.getInstance();
        int currentyear=calendar.get(Calendar.YEAR);
        int currentmonth=calendar.get(Calendar.MONTH)+1;
        int currentday=calendar.get(Calendar.DAY_OF_MONTH);
        if(currentday==calendar.getActualMaximum(Calendar.DAY_OF_MONTH)){
            currentday=25;
            calendar.set(currentyear,currentmonth-1,currentday,23,59,59);
            return calendar.getTime();
        }
        int consult=currentday/5;
        if(consult==0){
            currentmonth=currentmonth-1;
            calendar.set(currentyear,currentmonth,26,0,0,0);
            currentday=calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
            calendar.set(currentyear,currentmonth-1,currentday,23,59,59);
            return calendar.getTime();
        }
        int residue=currentday%5;
        currentday=currentday-residue;
        calendar.set(currentyear,currentmonth-1,currentday,23,59,59);
        return calendar.getTime();
    }

}
