package JSP18.com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import JSP18.com.model.LoginBean;

public class ControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/* URL요청이 Get 방식일 때 처리 Method */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/* URL요청이 Post 방식일 때 처리 Method */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/* 요청에 대한 응답으로 전달되는 콘텐츠의 MIME_Type CharSet 설정 */
		response.setContentType("text/html; charset=UTF-8");
		/* URL 요청으로 넘어온 Parameter 받기 */
		String id = request.getParameter("id"), password = request.getParameter("password");

		/* Model을 이용하여 Login시 Password 확인 */
		LoginBean bean = new LoginBean();

		bean.setId(id);
		bean.setPassword(password);
		/* 이동한 뷰에서 사용하기 위한 객체를 request에 저장 */
		request.setAttribute("bean", bean);

		boolean status = bean.validate();

		/* 비밀번호 맞는지 여부에 따른 결과 페이지 분기 처리 */
		if (status) {/* 패스워드가 admin인 경우 */
			/* Interface */
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("mvc_success.jsp");
			requestDispatcher.forward(request, response);
		} else {/* 패스워드가 admin이 아닌 경우 */
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("mvc_error.jsp");
			requestDispatcher.forward(request, response);
		}
	}

}