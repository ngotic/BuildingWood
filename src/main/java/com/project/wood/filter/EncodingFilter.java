package com.project.wood.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;


// 프로젝트 때 필터처리부터 셋팅하고 작업하자 
public class EncodingFilter implements Filter{
	
	private String encoding;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// System.out.println("필터 생성");
		this.encoding = filterConfig.getInitParameter("encoding");
		
		if(this.encoding == null || this.encoding.equals("")) {
			this.encoding = "UTF-8";
		}
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// System.out.println("필터 동작");
		// 인코딩 처리 
		request.setCharacterEncoding(this.encoding); // UTF-8을 xml에 넣는다. 
		//UTF-8로 안하고 매개변수로 넘겨서 언제나 쉽게 고칠 수 있게 한다. 
		// 그 다음 필터 및 서블릿 호출 
		response.setCharacterEncoding(this.encoding);
		chain.doFilter(request, response);
	}
	
	@Override
	public void destroy() {
		// System.out.println("필터 소멸");
	}
}
