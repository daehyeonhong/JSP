package mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final int LISTCOUNT = 5;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/* URL로 부터 요청 정보 얻기 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String requestURI = request.getRequestURI(), contextPath = request.getContextPath(),
				command = requestURI.substring(contextPath.length());

		/* 문자셋 설정 */
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("<html><bodt>" + request.getRequestURL() + "<br />" + requestURI + "<br />" + contextPath + "<br />"
				+ command + "<br />" + "</body></html>");

		/* 요청 command에 따른 분기 작업 */
		RequestDispatcher requestDispatcher = null;

		/*
		 * if (command.equals("/BoardListAction.do")) { DB에서 조회한 글 List를 request에 저장
		 * requestDispatcher = request.getRequestDispatcher("./board/list.jsp"); } else
		 * if (command.equals("/BoardWriteFormAction.do")) { requestDispatcher =
		 * request.getRequestDispatcher("./board/writeForm.jsp"); } else if
		 * (command.equals("/BoardWriteAction.do")) { form에서 넘어온 새 글 DB 저장 DB에 저장된 List
		 * 조회한 후 request에 저장 requestDispatcher =
		 * request.getRequestDispatcher("BoardListAction.do"); }
		 */

		switch (command) {
		case "/BoardListAction.do":
			/* DB에서 조회한 글 List를 request에 저장 */
			requestDispatcher = request.getRequestDispatcher("./board/list.jsp");
			break;
		case "/BoardWriteFormAction.do":
			requestDispatcher = request.getRequestDispatcher("./board/writeForm.jsp");
			break;
		case "/BoardWriteAction.do":
			/* form에서 넘어온 새 글 DB 저장 */
			/* DB에 저장된 List 조회한 후 request에 저장 */
			requestDispatcher = request.getRequestDispatcher("BoardListAction.do");
			break;
		default:
			requestDispatcher = request.getRequestDispatcher("/exceptionNoPage.jsp");
			break;
		}
		requestDispatcher.forward(request, response);
	}

}