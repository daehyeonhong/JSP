package com.hongdae.web;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/calc")
public class Calc_2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ServletContext application = request.getServletContext();

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String v_ = request.getParameter("v"), op_ = request.getParameter("operator");
		int v = 0, result = 0;

		if (!v_.equals("")) {
			v = Integer.parseInt(v_);
		}
		if (op_.equals("=")) {
			int x = (Integer) application.getAttribute("value");
			int y = v;
			String op = (String) application.getAttribute(op_);

			if (op.equals("+")) {
				result = x + y;
			} else {
				result = x - y;
			}
		} else {
			application.setAttribute("value", v_);
			application.setAttribute("op_", op_);
		}

		response.getWriter().printf("result is %d\n", result);
		application.setAttribute("value", v);
		application.setAttribute("op", op_);
	}
}
