package com.hongdae.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Add_r
 */
@WebServlet("/add_r")
public class Add_r extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/http; charset=UTF-8");
		String x_ = request.getParameter("x"), y_ = request.getParameter("y");
		int x = 0, y = 0, result = 0;
		if (!(x_.equals(""))) {
			x = Integer.parseInt(x_);
		}
		if (!(y_.equals(""))) {
			y = Integer.parseInt(y_);
		}
		result = x + y;
		response.getWriter().println(result);
	}

}
