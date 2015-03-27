package com.tonghang.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EncodingFilter implements Filter {
	private String targetEncoding = "utf-8";
	protected FilterConfig filterconfig;
	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest srequest, ServletResponse sresponse,
		     FilterChain chain) throws IOException, ServletException {
		    // TODO Auto-generated method stub
		    HttpServletRequest hrequest = (HttpServletRequest) srequest;
		    HttpServletResponse hresponse = (HttpServletResponse) sresponse;
		    hrequest.setCharacterEncoding(targetEncoding);
		    hresponse.setCharacterEncoding(targetEncoding);
		    chain.doFilter(hrequest, hresponse);
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		// TODO Auto-generated method stub
		this.filterconfig = config;
	    this.targetEncoding = config.getInitParameter("encoding");
	}

}
