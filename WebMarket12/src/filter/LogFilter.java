package filter;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class LogFilter implements Filter {
	/* 로그 기록객체 생성 */
	PrintWriter writer;

	public void destroy() {
		/* 자원해제 처리 */
		writer.close();
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		writer.printf("접촉한 클라이언트 IP: %s %n", request.getRemoteAddr());
		long start = System.currentTimeMillis();
		writer.printf("요청방식: %s %n", ((HttpServletRequest) request).getMethod());
		writer.printf("접근한 URL 경로: %s %n", getURLPath(request));
		writer.printf("요청 처리 시작 시각: %s %n", getCurrentTime());
		chain.doFilter(request, response);

		long end = System.currentTimeMillis();
		writer.printf("요청 처리 종료시각: %s %n", getCurrentTime());
		writer.printf("요청 처리 소요시간: %s ms%n", (end - start));
		writer.printf("────────────────────────────────────%n");
	}

	private String getCurrentTime() {
		/* 날짜 출력 포멧 객체 생성 */
		DateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss.S");
		/* 달력정보 얻기 */
		Calendar calendar = Calendar.getInstance();/* Calendar Singleton객체 얻기 */
		/* 달력객체 현재 날짜 시간정보 */
		calendar.setTimeInMillis(System.currentTimeMillis());
		/* 현재 날짜 정보를 format형식으로 리턴 */
		return formatter.format(calendar.getTime());
	}

	private String getURLPath(ServletRequest request) {
		HttpServletRequest req;
		String currentPath = "";
		String queryString = "";
		if (request instanceof HttpServletRequest) {
			req = (HttpServletRequest) request;/* casting */
			currentPath = req.getRequestURI();
			queryString = queryString == null ? "" : "?" + queryString;
		}
		System.out.println("url: " + currentPath + queryString);
		return currentPath + queryString;
	}

	public void init(FilterConfig fConfig) throws ServletException {
		/* 로그기록할 파일정보 얻기 */
		String filename = fConfig.getInitParameter("filename");
		if (filename == null) {
			throw new ServletException("로그파일 이름을 찾을 수 없습니다.");
		}
		try {
			/* 로그기록할 파일객체 생성 */
			writer = new PrintWriter(new FileWriter(filename, true), true);
		} catch (Exception e) {
			throw new ServletException("로그파일을 열 수 없습니다.");
		}
	}
}
