package com.akcord.search.service;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;


import org.springframework.stereotype.Service;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import com.akcord.search.model.SearchDto;

@Service
public class SearchServiceImpl implements SearchService{
	private static String clientID = "ZEu05Cr5OB9_d08nu2uw";
	private static String clientSecret = "rlYpeNimBn";
	@Override
	public List<SearchDto> Searchreturn(String keyword, int display, int start) {
		List<SearchDto> list = null;
		try {
			URL url;
		
			url = new URL("https://openapi.naver.com/v1/search/blog.xml?query=" + URLEncoder.encode(keyword, "UTF-8")
					+ (display != 0 ? "&display=" + display : "") + (start != 0 ? "&start=" + start : ""));

			URLConnection urlConn = url.openConnection();
			urlConn.setRequestProperty("X-Naver-Client-Id", clientID);
			urlConn.setRequestProperty("X-Naver-Client-Secret", clientSecret);

			XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
			XmlPullParser parser = factory.newPullParser();
			parser.setInput(new InputStreamReader(urlConn.getInputStream()));
			// Test에서 했던 방식은 DOM방식이기때문에?
			// 그래서 이렇게 해도 된다?!??!??!?

			int eventType = parser.getEventType();
			SearchDto b = null;
			while (eventType != XmlPullParser.END_DOCUMENT) {
				switch (eventType) {
				case XmlPullParser.END_DOCUMENT: // 문서의 끝
					break;
				case XmlPullParser.START_DOCUMENT:
					list = new ArrayList<SearchDto>();
					break;
				case XmlPullParser.END_TAG: {
					String tag = parser.getName();
					if (tag.equals("item")) {
						list.add(b);
						b = null;
					}
				}
				case XmlPullParser.START_TAG: {
					String tag = parser.getName();
					switch (tag) {
					case "item":
						b = new SearchDto();
						break;
					case "postdate":
						if (b != null)
							b.setPostdate(parser.nextText());
						break;
					case "total":
						if (b != null)
							b.setTotal(parser.nextText());
						break;
					case "start":
						if (b != null)
							b.setStart(parser.nextText());
						break;
					case "display":
						if (b != null)
							b.setDisplay(parser.nextText());
						break;
					case "title":
						if (b != null)
							b.setTitle(parser.nextText());
						break;
					case "link":
						if (b != null)
							b.setLink(parser.nextText());
						break;
					case "description":
						if (b != null)
							b.setDescription(parser.nextText());
						break;
					case "bloggername":
						if (b != null)
							b.setBloggername(parser.nextText());
						break;
					case "bloggerlink":
						if (b != null)
							b.setBloggerlink(parser.nextText());
						break;

					}

				}
				}
				eventType = parser.next();
			}

		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (XmlPullParserException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	// display ==> 몇개 출력
	// start==>몇번쨰부터 (item)

}
