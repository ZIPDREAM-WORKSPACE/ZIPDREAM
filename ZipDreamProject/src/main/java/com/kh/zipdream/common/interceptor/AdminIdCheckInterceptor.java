package com.kh.zipdream.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.zipdream.member.model.vo.Member;

public class AdminIdCheckInterceptor extends HandlerInterceptorAdapter {
	
	@Override // 전처리할 메서드 작성
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
		
		boolean result = false;
		
		HttpSession session = request.getSession();
		String url = request.getRequestURI().split("/")[3];

		if(url.equals("noticeList")) {
			result = true;
			
		}
		if(session.getAttribute("loginUser") != null) {
			Member loginUser = (Member)session.getAttribute("loginUser");
			if(loginUser.getUserLevel() == 3) {
				result = true;
			}	
		}
		return result;
	}
	@Override // 후처리할 메서드 작성
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) {
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
		
	}
}
