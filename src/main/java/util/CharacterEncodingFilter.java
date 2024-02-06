package util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;


public class CharacterEncodingFilter implements Filter {

	private String encoding;
	
	@Override
	public void init(FilterConfig config) throws ServletException {
		
		encoding = config.getInitParameter("encoding");
		if (encoding == null) {
			encoding = "utf-8";
		}
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("문자인코딩설정 - 완료후 삭제");
		request.setCharacterEncoding(encoding);
		chain.doFilter(request, response);
	}


	@Override
	public void destroy() { }

}





