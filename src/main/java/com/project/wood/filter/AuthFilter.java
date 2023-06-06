package com.project.wood.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AuthFilter implements Filter{
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		//System.out.println("권한 필터 생성");
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) // reqponse나 reqpuse쓸려면 형변환해라
			throws IOException, ServletException {
		//System.out.println("권한 체크 필터 동작");
		HttpServletRequest req = (HttpServletRequest)request;
		HttpSession session = req.getSession();
		
		System.out.println(req.getRequestURI());
		
		if (session.getAttribute("id") == null ) {  
			if (!req.getRequestURI().equals("/wood/index.do") && !req.getRequestURI().contains("login")) {
				PrintWriter writer = ((HttpServletResponse)response).getWriter();
				response.setCharacterEncoding("UTF-8");
				writer.write("<head><meta charset='UTF-8'></head><script>alert('failed.'); location.href='/wood/index.do'; </script>");
				writer.close();
				return ;
			}
		}
		// TODO : 로그인 후 바로가는 메인 페이지를 제작해야함
		//        그 때 그 페이지로 리다이렉트 
		
		
		//if(req.getRequestURI().endsWith(null)) // 내가 쓴글에 접근했다? 이건 필터로 하기 힘들다.
		chain.doFilter(request, response);
	}
	
	@Override
	public void destroy() {
		//System.out.println("권한 필터 소멸");
	}
}
