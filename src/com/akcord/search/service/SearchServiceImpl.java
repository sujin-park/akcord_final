package com.akcord.search.service;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.SystemPropertyUtils;
import org.springframework.web.client.RestTemplate;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import com.akcord.in.model.InDto;
import com.akcord.mypage.model.MypageDto;
import com.akcord.myroom.model.MyroomNextDto;
import com.akcord.search.dao.SearchDao;
import com.akcord.search.model.SearchDto;
import com.akcord.search.model.SearchTotalDto;
import com.akcord.search.model.SearchdaumDto;

@Service
public class SearchServiceImpl implements SearchService {
	@Autowired
	private SqlSession sqlSession;

	private static String clientID = "ZEu05Cr5OB9_d08nu2uw";
	private static String clientSecret = "rlYpeNimBn";

	@Override
	public List<SearchTotalDto> Searchreturn(String keyword, int display, int start) {
		List<SearchTotalDto> list = null;
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
			SearchTotalDto b = null;

			while (eventType != XmlPullParser.END_DOCUMENT) {

				switch (eventType) {
				case XmlPullParser.END_DOCUMENT: // 문서의 끝
					break;
				case XmlPullParser.START_DOCUMENT:
					list = new ArrayList<SearchTotalDto>();
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
						b = new SearchTotalDto();
						break;
					case "postdate":
						if (b != null)
							b.setReg_date(parser.nextText());
						break;
					case "title":
						if (b != null)
							b.setSubject(parser.nextText());
						break;
					case "link":
						if (b != null)
							b.setLink(parser.nextText());

						break;
					case "description":
						if (b != null){
							b.setContent(parser.nextText());
						String str1 =b.getContent();
						String[] words = str1.split(keyword);
						b.setCount(words.length);
						break;}
					case "bloggername":
						if (b != null)
							b.setUser_name(parser.nextText());
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
	@Override
	public List<SearchTotalDto> SearchCafereturn(String keyword, int display, int start) {
		List<SearchTotalDto> list = null;
		try {
			URL url;

			url = new URL("https://openapi.naver.com/v1/search/cafearticle.xml?query=" + URLEncoder.encode(keyword, "UTF-8")
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
			SearchTotalDto b = null;

			while (eventType != XmlPullParser.END_DOCUMENT) {

				switch (eventType) {
				case XmlPullParser.END_DOCUMENT: // 문서의 끝
					break;
				case XmlPullParser.START_DOCUMENT:
					list = new ArrayList<SearchTotalDto>();
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
						b = new SearchTotalDto();
						break;
					case "postdate":
						if (b != null)
							b.setReg_date(parser.nextText());
						break;
					case "title":
						if (b != null)
							b.setSubject(parser.nextText());
						break;
					case "link":
						if (b != null)
							b.setLink(parser.nextText());

						break;
					case "description":
						if (b != null){
							b.setContent(parser.nextText());
						String str1 =b.getContent();
						String[] words = str1.split(keyword);
						b.setCount(words.length);
						break;}
					case "cafename":
						if (b != null)
							b.setUser_name(parser.nextText());
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
	}@Override
	public List<SearchTotalDto> SearchJisicreturn(String keyword, int display, int start) {
		List<SearchTotalDto> list = null;
		try {
			URL url;

			url = new URL("https://openapi.naver.com/v1/search/kin.xml?query=" + URLEncoder.encode(keyword, "UTF-8")
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
			SearchTotalDto b = null;

			while (eventType != XmlPullParser.END_DOCUMENT) {

				switch (eventType) {
				case XmlPullParser.END_DOCUMENT: // 문서의 끝
					break;
				case XmlPullParser.START_DOCUMENT:
					list = new ArrayList<SearchTotalDto>();
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
						b = new SearchTotalDto();
						break;
					case "postdate":
						if (b != null)
							b.setReg_date(parser.nextText());
						break;
					case "title":
						if (b != null)
							b.setSubject(parser.nextText());
						break;
					case "link":
						if (b != null)
							b.setLink(parser.nextText());

						break;
					case "description":
						if (b != null){
							b.setContent(parser.nextText());
						String str1 =b.getContent();
						String[] words = str1.split(keyword);
						b.setCount(words.length);
						break;}
					

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

	@Override
	public List<SearchTotalDto> Searchdaumreturn(String keyword, int pageno, int result) {
		List<SearchTotalDto> list = new ArrayList<>();
		String url = "https://apis.daum.net/search/blog?apikey=39564e55e4f411599c7701580ae3815d&q=" + keyword
				+ "&output=xml";
		RestTemplate restTemplate = new RestTemplate();
		String response = restTemplate.getForObject(url, String.class);
		// //output은 xml 또는 json 방식중 골라서 선택가능

		Document doc;
		try {
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			InputSource is = new InputSource(new StringReader(response));
			doc = dBuilder.parse(is);
			doc.getDocumentElement().normalize();
			NodeList nList = doc.getElementsByTagName("item");
			// System.out.println("nList.length = " + nList.getLength());
			for (int temp = 0; temp < nList.getLength(); temp++) {
				Node nNode = nList.item(temp);
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {
					SearchTotalDto searchTotalDto = new SearchTotalDto();
					Element eElement = (Element) nNode;
					searchTotalDto.setSubject(getNodesValue(eElement, "title"));
					searchTotalDto.setUser_name(getNodesValue(eElement, "author"));
					searchTotalDto.setLink(getNodesValue(eElement, "link"));
					searchTotalDto.setReg_date(getNodesValue(eElement, "pubDate"));
					searchTotalDto.setContent(getNodesValue(eElement, "description"));
					String str1 = searchTotalDto.getContent();
					String[] words = str1.split(keyword);
					searchTotalDto.setCount(words.length);
					list.add(searchTotalDto);
				}
			}
		} catch (SAXException e1) {
			e1.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		}

		return list;
	}
	@Override
	public List<SearchTotalDto> SearchJisicdaumreturn(String keyword, int pageno, int result) {
		List<SearchTotalDto> list = new ArrayList<>();
		String url = "https://apis.daum.net/search/knowledge?apikey=39564e55e4f411599c7701580ae3815d&q=" + keyword
				+ "&output=xml";
		RestTemplate restTemplate = new RestTemplate();
		String response = restTemplate.getForObject(url, String.class);
		// //output은 xml 또는 json 방식중 골라서 선택가능

		Document doc;
		try {
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			InputSource is = new InputSource(new StringReader(response));
			doc = dBuilder.parse(is);
			doc.getDocumentElement().normalize();
			NodeList nList = doc.getElementsByTagName("item");
			// System.out.println("nList.length = " + nList.getLength());
			for (int temp = 0; temp < nList.getLength(); temp++) {
				Node nNode = nList.item(temp);
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {
					SearchTotalDto searchTotalDto = new SearchTotalDto();
					Element eElement = (Element) nNode;
					searchTotalDto.setSubject(getNodesValue(eElement, "title"));
					searchTotalDto.setUser_name(getNodesValue(eElement, "category"));
					searchTotalDto.setLink(getNodesValue(eElement, "link"));
					searchTotalDto.setReg_date(getNodesValue(eElement, "pubDate"));
					searchTotalDto.setContent(getNodesValue(eElement, "description"));
					String str1 = searchTotalDto.getContent();
					String[] words = str1.split(keyword);
					searchTotalDto.setCount(words.length);
					list.add(searchTotalDto);
				}
			}
		} catch (SAXException e1) {
			e1.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		}

		return list;
	}
	@Override
	public List<SearchTotalDto> SearchCafedaumreturn(String keyword, int pageno, int result) {
		List<SearchTotalDto> list = new ArrayList<>();
		String url = "https://apis.daum.net/search/cafe?apikey=39564e55e4f411599c7701580ae3815d&q=" + keyword
				+ "&output=xml";
		RestTemplate restTemplate = new RestTemplate();
		String response = restTemplate.getForObject(url, String.class);
		// //output은 xml 또는 json 방식중 골라서 선택가능

		Document doc;
		try {
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			InputSource is = new InputSource(new StringReader(response));
			doc = dBuilder.parse(is);
			doc.getDocumentElement().normalize();
			NodeList nList = doc.getElementsByTagName("item");
			// System.out.println("nList.length = " + nList.getLength());
			for (int temp = 0; temp < nList.getLength(); temp++) {
				Node nNode = nList.item(temp);
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {
					SearchTotalDto searchTotalDto = new SearchTotalDto();
					Element eElement = (Element) nNode;
					searchTotalDto.setSubject(getNodesValue(eElement, "title"));
					searchTotalDto.setUser_name(getNodesValue(eElement, "cafeName"));
					searchTotalDto.setLink(getNodesValue(eElement, "link"));
					searchTotalDto.setReg_date(getNodesValue(eElement, "pubDate"));
					searchTotalDto.setContent(getNodesValue(eElement, "description"));
					String str1 = searchTotalDto.getContent();
					String[] words = str1.split(keyword);
					searchTotalDto.setCount(words.length);
					list.add(searchTotalDto);
				}
			}
		} catch (SAXException e1) {
			e1.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		}

		return list;
	}


	private String getNodesValue(Element e, String tagName) {
		String value = "";
		NodeList nlList = e.getElementsByTagName(tagName).item(0).getChildNodes();
		for (int i = 0; i < nlList.getLength(); i++) {
			if (nlList.item(i).getNodeName().equals("b")) {
				value += "<b>" + nlList.item(i).getTextContent() + "</b>";
			} else {
				value += nlList.item(i).getTextContent();
			}
		}
		// System.out.println(tagName + " = " + value);
		return value;
	}

	@Override
	public List<MyroomNextDto> SearchMypageDto(String keyword) {
		// TODO Auto-generated method stub
		System.out.println("여긴 오냐");
		return sqlSession.getMapper(SearchDao.class).SearchMypageDto(keyword);
	}

	@Override
	public List<InDto> SearchInQnaDto(String keyword) {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(SearchDao.class).SearchInQnaDto(keyword);
	}

}
