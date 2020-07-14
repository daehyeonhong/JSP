package ch12.com.filter;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/*경로 지정*/
/*@WebFilter("/InitParameterFilter")*/
public class InitParameterFilter implements Filter {
	/* web.xml에 등록된 초기화 정보 얻기 위한 변수 선언 */
	private FilterConfig filterConfig;

	/* init() */
	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("Filter02 초기화...(최초 1회 실행)");
		this.filterConfig = fConfig;
	}

	public void destroy() {
		System.out.println("Filter02 해제...(서버에서 제거시 실행)");
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("Filter02 수행...(자원 요청시 마다 실행)");
		/* init()_Method에서 얻은 초기화 정보를 [Parameter_name]으로 얻기 */
		/* getInitParameter([Parameter_name]); */
		String id = request.getParameter("id"), passwd = request.getParameter("passwd"),
				param1 = filterConfig.getInitParameter("param1"), param2 = filterConfig.getInitParameter("param2"),
				message;
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/HTML; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		message = (id.equals(param1) && passwd.equals(param2)) ? "로그인 성공!" : "로그인 실패!";
		/* 메시지 출력 */
		writer.print(message);

		/* 자원으로 request를 보냄 */
		chain.doFilter(request, response);
	}
}