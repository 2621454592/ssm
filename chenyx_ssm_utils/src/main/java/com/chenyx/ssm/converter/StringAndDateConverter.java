package com.chenyx.ssm.converter;

import org.junit.Test;

import java.util.Date;
import java.text.SimpleDateFormat;



public  class StringAndDateConverter {

	@Test
	public static String Converter(String str){
		String date = null;
		//接收String类型时间的格式
		//SimpleDateFormat stringToDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat stringToDateFormat = new SimpleDateFormat("MM/dd/yyyy - HH:mm");
		//输出Date类型时间的字符串格式
		SimpleDateFormat dateToStringFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:00.000000");
		//dd-MM-yyyy HH:mm:00:000000
		try {
			//Date today = stringToDateFormat.parse("2018-12-22 15:34:32");

			Date today = stringToDateFormat.parse(str);
			date = dateToStringFormat.format(today);
			System.out.println(date);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return date;
	}
}
