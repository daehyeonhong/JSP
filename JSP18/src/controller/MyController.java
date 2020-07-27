package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MyController")
/* HttpServlet_Class를 상속 받아서 Servlet_Class 생성 */
public class MyController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/* 부모 클래스(HttpServlet) [doGet()_Method] Override */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/* View로 전달할 Message를 request객체에 저장 */
		request.setAttribute("message", "Hello, Java Server Pages!");
		/* [View_Page]로 이동 */
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("view.jsp");
		requestDispatcher.forward(request, response);
	}

}