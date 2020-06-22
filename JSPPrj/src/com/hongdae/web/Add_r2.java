package com.hongdae.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/add_r2")
public class Add_r2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String x_ = request.getParameter("x"), y_ = request.getParameter("y");

		int x = (!(x_.equals(""))) ? Integer.parseInt(x_) : 0, y = (!(y_.equals(""))) ? Integer.parseInt(y_) : 0,
				result = x + y;

		response.getWriter().printf("%s과(와) %s의 합: %s", x_, y_, result);
	}
}