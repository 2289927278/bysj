package com.iflytek.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
    public static String dateFormat(Date date){
    	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:MM:ss");
    	return sdf.format(date);
    }
    
    public static Date dateParse(String date){
    	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
    	Date date1=null;
    	try {
			 date1=sdf.parse(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return date1;
    }
    public static String getTime(){
    	Date time=new Date();
    	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	
    	return sdf.format(time);
    	
    }
   /* public static void main(String[] args) {
		getTime();
	}*/
    
}
