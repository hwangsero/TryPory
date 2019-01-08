package kr.co.mlec.util;

import java.util.List;

public class ListUtil {

	public static String toString(List<String> list) {
		String str = "";
		for (int i = 0; i < list.size(); i++) { // list = ArrayList instance variable
			str += list.get(i);
			if( i + 1 != list.size())
				str += ", ";
		}
		return str;
	}

}
