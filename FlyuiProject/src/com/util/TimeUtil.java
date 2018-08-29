package com.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeUtil {

	static long nd=1000*24*60*60;
	static long nh=1000*60*60;
	static long nm=1000*60;
	public static String calculateTime(Date date) {
		
		Date nowdate=new Date();
		long nowl=nowdate.getTime();
		long oldl=date.getTime();
		long time=nowl-oldl;
		long day=time/nd;
		long hour=time%nd/nh;
		long min=time%nd%nh/nm;
		if(day>=1 && day<=5) {
			return day+"天前";
		}else if(hour>=1 && hour<=24 && day<1) {
			return hour+"小时前";
		}else if(min>=1 && min<60 && day<1 && hour<1) {
			return min+"分钟前";
		}else if(min<1){
			return "刚刚";
		}else {
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			return sdf.format(date);
		}
	}
}
