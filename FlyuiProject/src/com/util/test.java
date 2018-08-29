package com.util;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

public class test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		//SimpleDateFormat sdf=new SimpleDateFormat("")
//		Date date=new Date(1534571726000l);
//		
//		System.out.println(TimeUtil.calculateTime(date));
		Map<String, String> map = new HashMap<>();
		map.put("zhang","4");
		map.put("wang", "3");
		map.put("zhang","2");
		map.put("zhang", "0");
		map.put("wang", "1");
		System.out.print(map.size());
		for (Entry<String, String> entry:map.entrySet()) {
			System.out.println(entry.getKey()+":"+entry.getValue());
		}

	}

}
