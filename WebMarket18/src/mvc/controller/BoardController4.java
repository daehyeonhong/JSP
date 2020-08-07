package mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardController4 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/* URL로 부터 요청 정보 얻기 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI(), contextPath = request.getContextPath(),
				command = requestURI.substring(contextPath.length()),
				className = "mvc.controller." + command.substring(1, command.lastIndexOf(".do"));
		/* 문자셋 설정 */
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("<html><bodt>" + request.getRequestURL() + "<br />" + requestURI + "<br />" + contextPath + "<br />"
				+ command + "<br />" + className + "<br />" + "</body></html>");

		/* 요청 command에 따른 분기 작업 */
		String view = "";
		/* DB에서 조회한 글 List를 request에 저장 */
		Class clazz;
		try {
			clazz = Class.forName(className);/* Loading */
			Command action = (Command) clazz.newInstance();/* Interface Construct */
			view = action.command(request, response);
			request.getRequestDispatcher(view).forward(request, response);
		} catch (ClassNotFoundException | InstantiationException | IllegalAccessException e) {
			e.printStackTrace();
		}
	}
}