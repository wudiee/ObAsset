package com.ob.config;

import javax.servlet.Filter;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class WebAppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer { 
	                                   // -> 스프링이 제공하는 추상클래스

	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class<?>[] {ApplicationConfig.class}; // 처음 요청이 들어왔을때 읽는부분
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class<?>[] {MvcConfig.class}; // MvcConfig 리턴 
	}

	@Override
	protected String[] getServletMappings() { // servlet의 url처음 매핑하는 부분 
		return new String[] {"/"}; // url-pattern
	}

	@Override
	protected Filter[] getServletFilters() { // Filtering 등록: utf-8로 인코딩 설정 
		CharacterEncodingFilter encodingFilter = new CharacterEncodingFilter();
		encodingFilter.setEncoding("utf-8"); 
		return new Filter[] {encodingFilter};	
	}

}

