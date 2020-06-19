package ch01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Gugu") // 가상 경로
public class Gugu/* 실제 주소 */ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int dan = Integer.parseInt(request.getParameter("dan"));
		PrintWriter out = response.getWriter();
		out.write("<html>");
		for (int i = 1; i <= 9; i++) {
			out.write(dan + "*" + i + " = " + (dan * i) + "<br>");
		}
		out.write("</html>");
	}
};