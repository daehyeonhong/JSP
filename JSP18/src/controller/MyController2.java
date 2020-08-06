package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* Servlet에서 처리한 결과물을 View로 전달하기 위한 작업 */
		/* 요청에 대한 결과 페이지(view2) 이동 */
		request.setAttribute("message", "Hello, World!");
		request.setAttribute("now", (new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date())));
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("view2.jsp");
		requestDispatcher.forward(request, response);
	}
}