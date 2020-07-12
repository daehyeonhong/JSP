package dto;

import java.io.IOException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Calc extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Cookie[] cookies = request.getCookies();

		String value = request.getParameter("value"), operator = request.getParameter("operator"), expression = "0",
				dot = request.getParameter("dot");

		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("operator")) {
					expression = cookie.getValue();
					break;
				}
			}
		}

		if (operator != null && operator.equals("=")) {

		} else {
			expression += (value == null) ? "" : value;
			expression += (operator == null) ? "" : operator;
			expression += (dot == null) ? "" : dot;
		}

		Cookie expressionCookie = new Cookie("expression", expression);

		response.addCookie(expressionCookie);
		response.sendRedirect("calcPage");
	}
}
