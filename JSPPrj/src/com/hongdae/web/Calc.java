package com.hongdae.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/calc")
public class Calc extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String x_ = request.getParameter("x"), y_ = request.getParameter("y"), op_ = request.getParameter("operator");
		int x = 0, y = 0;
		if (!x_.equals("")) {
			x = Integer.parseInt(x_);
		}
		if (!y_.equals("")) {
			y = Integer.parseInt(y_);
		}
		int result = 0;
		if (op_.equals("덧셈")) {
			result = x + y;
		} else {
			result = x - y;
		}

		response.getWriter().printf("result is %d\n", result);
	}
}
