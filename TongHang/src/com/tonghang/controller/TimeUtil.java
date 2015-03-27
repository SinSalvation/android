package com.tonghang.controller;

import java.sql.Date;
import java.util.Calendar;

public class TimeUtil {
	
	public static Date timeChange(String formatTime){
		String datetime[] = formatTime.split("\\s");
		String date[] = datetime[0].split("[-]");
		System.out.println("year="+date[0]);
		System.out.println("month="+date[1]);
		System.out.println("day="+date[2]);
		String time[] = datetime[1].split("[:]");
		System.out.println("hour="+time[0]);
		System.out.println("minute="+time[1]);
		System.out.println("second="+time[2]);
		Calendar c = Calendar.getInstance();
		c.set(Integer.parseInt(date[0]),Integer.parseInt(date[1])-1,Integer.parseInt(date[2]), 
				Integer.parseInt(time[0]),Integer.parseInt(time[1]),Integer.parseInt(time[2]));
		return new Date(c.getTime().getTime());
	}
}
