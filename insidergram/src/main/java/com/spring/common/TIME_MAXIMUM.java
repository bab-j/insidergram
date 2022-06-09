package com.spring.common;

import java.util.Date;

public class TIME_MAXIMUM {
	public static final int SEC = 60;
	public static final int MIN = 60;
	public static final int HOUR = 48;
	public static final int DAY = 30;
	public static final int MONTH = 12;
	

	public static String formatTimeString(Date tempDate) {
		long curTime = System.currentTimeMillis();
		System.out.println("현재시간 : " + curTime);
		long regTime = tempDate.getTime();
		System.out.println("등록시간 : " + regTime);
		long diffTime = (curTime - regTime) / 1000;
		System.out.println("시차 : " + diffTime);
		String msg = null;
		if (diffTime < TIME_MAXIMUM.SEC) {
			// sec
			msg = "방금 전";
		} else if ((diffTime /= TIME_MAXIMUM.SEC) < TIME_MAXIMUM.MIN) {
			// min
			msg = diffTime + "분전";
		} else if ((diffTime /= TIME_MAXIMUM.MIN) < TIME_MAXIMUM.HOUR) {
			// hour
			msg = (diffTime) + "시간전";
			// day
		} else if ((diffTime /= TIME_MAXIMUM.HOUR) < TIME_MAXIMUM.DAY) {
			msg = (diffTime) + "일전";
			// month
		} else if ((diffTime /= TIME_MAXIMUM.DAY) < TIME_MAXIMUM.MONTH) {
			msg = (diffTime) + "달전";
		} else {
			// year
			msg = (diffTime) + "년전";
		}
		return msg;
	}
}
