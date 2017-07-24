package com.akcord.util;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class Encoding {

	// 한글 넘어올 때 처리하는 것
	public static String isoToUtf(String tmp) {
		String utf = "";
		try {
			if (tmp != null) {
				utf = new String(tmp.getBytes("ISO-8859-1"), "UTF-8");
			}
		} catch (UnsupportedEncodingException e) {

			e.printStackTrace();
		}
		return utf;

	}
// 한글 넘겨줄 때 처리하는 것 
	public static String urlUtf(String tmp) {
		String utf = "";
		try {
			if (tmp != null) {

				utf = URLEncoder.encode(tmp, "UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return utf;
	}
}
