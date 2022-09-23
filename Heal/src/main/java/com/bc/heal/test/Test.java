package com.bc.heal.test;

import java.util.ArrayList;
import java.util.List;

public class Test {
	public static void main(String[] args) {
		String test = "06:00(우등)/06:20/06:40(우등) 07:20/07:40(우등)/08:20 08:40(우등)/09:20/09:40(우등) 09:55(우등)/10:10/10:25(우등) 10:55(우등)/11:10(우등)/11:25 11:40(우등)/12:10(우등)/12:25 12:40(우등)/13:10(우등)/13:25 13:40(우등)/13:55/14:10(우등) 14:40/14:55(우등)/15:25(우등) 15:40/16:10/16:25(우등) 16:40(우등)/16:55/17:10(우등) 17:40(우등)/17:55(우등)/18:10 18:25(우등)/19:00(우등)/19:20 19:40(우등)/20:20(우등)/20:40 21:00/21:20(우등)/21:40";
		
		List<String> list = new ArrayList<String>();
		int time = 0;
		
		while(true) {
			time = test.indexOf(":",time+1);
			System.out.println(time);
			
			if(time == -1) {
				break;
			}
			list.add(test.substring(time-2, time+3));
		}
		
		System.out.println(list.toString());
	}
}
