package com.project.wood.util;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

import com.test.mycrypto.DESUtil;

//String desEmailApiKey = DESUtil.encrypt(key);
// 키는 모두 apikey.properties에 인코딩된 상태로 저장
public class ApiKeyHolder { // static으로 지정해놓음
	
	private static String EMAIL = "emailkey";
	private static String NAVERLOGIN = "naversecretkey";
	private static String GOOGLELOGIN = "googlesecretkey";
	private static String CONFIG_FOLDER_NAME="config";
	private static String CONFIG_FILE_NAME = "apikey.properties";
	private static Properties properties ;
	static {
		properties = new Properties();
	}
	// getServletContext().getRealPath("/") 이걸 넣어야 된다...
	// ApiKeyHolder.getEmailKey(getServletContext().getRealPath("/")) // 키값 호출
	public static String getEmailKey(String contextPath) {
		return getKey(contextPath, EMAIL);
	}
	public static String getGoogleLoginSecretKey(String contextPath) {
		return getKey(contextPath, GOOGLELOGIN);
	} 
	public static String getNaverLoginSecretKey(String contextPath) {
		return getKey(contextPath, NAVERLOGIN);
	} 
	private static String getKey(String contextPath, String TYPE) {
		try {
			properties.load(new FileReader(contextPath+"/"+CONFIG_FOLDER_NAME+"/"+CONFIG_FILE_NAME));
			return DESUtil.decrypt((String)properties.get(TYPE));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	} 
}
