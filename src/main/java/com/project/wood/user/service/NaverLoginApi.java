package com.project.wood.user.service;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.URLEncoder;
import java.security.SecureRandom;

public class NaverLoginApi {
	private String clientId;
	private String naverUrl;
	private String redirectURI;
	private String state; 
	
	public NaverLoginApi() {
		naverUrl = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
		clientId = "mchWypGBN850Xh6xPCFE";
		redirectURI = "http://localhost:8090/wood/logincallback.do";
		SecureRandom random = new SecureRandom();
		state = new BigInteger(130, random).toString();
	}
	
	public String getNaverLoginUrl(){
	    
		try {
			
		    naverUrl += "&client_id=" + this.clientId;
		    naverUrl += "&redirect_uri=" + URLEncoder.encode(this.redirectURI, "UTF-8");;
		    naverUrl += "&state=" + state;
		    
		} catch (Exception e) {
			e.printStackTrace();
		}
	    return naverUrl;
	}
}
