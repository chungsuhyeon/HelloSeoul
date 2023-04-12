package com.bit.web.pys;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;

import org.json.*;
import org.json.simple.JSONObject;

import twitter4j.internal.org.json.JSONException;

public class JsonParsing {
	
	public String jsonReadAll(Reader reader) throws IOException {
		StringBuilder sb = new StringBuilder();
		
		int cp;
		
		while((cp=reader.read())!=-1) {
			sb.append((char)cp);
		}
		
		return sb.toString();
	}
	
//	public JSONObject readJsonFromUrl(String url) throws IOException, JSONException{
//		InputStream is = new URL(url).openStream();
//		
//		try {
//			BufferedReader br = new BufferedReader(new InputStreamReader(is,Charset.forName("UTF-8")));
//			String jsonText = jsonReadAll(br);
//			JSONObject json = new JSONObject(jsonText);
//			return json;
//		} finally {
//			is.close();
//			// TODO: handle finally clause
//		}
//	}

}
