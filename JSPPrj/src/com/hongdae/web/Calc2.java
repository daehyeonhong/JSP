package com.hongdae.web;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/calc2")
public class Calc2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String v_ = request.getParameter("v"), op_ = request.getParameter("operator");

		int v = 0;

		if (!v_.equals("")) {
			v = Integer.parseInt(v_);
		}
		ServletContext application = request.getServletContext();
		application.setAttribute("value", v);
		int result = 0;

		response.getWriter().printf("result is %d\n", result);
	}
}
