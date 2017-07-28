package utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Administrator on 2017/7/14.
 */
public class DateUtil {

  public static Date str2date(String strDate){
      Date str2date=null;
      DateFormat format=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
      try {
          str2date=format.parse(strDate);
      } catch (ParseException e) {
          e.printStackTrace();
      }
      return  str2date;
   }

}
