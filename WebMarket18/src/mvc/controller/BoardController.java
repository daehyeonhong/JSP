package mvc.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/* 초기화 처리 */
	private Map<String, Command> CommandMap = new HashMap<String, Command>();

	@Override
	public void init(ServletConfig config) throws ServletException {
		String conf = config.getInitParameter("config");
		Properties properties = new Properties();
		FileInputStream fileInputStream = null;
		try {
			fileInputStream = new FileInputStream(conf);
			properties.load(fileInputStream);
		} catch (Exception e) {
			throw new ServletException();
		} finally {
			try {
				if (fileInputStream != null) {
					fileInputStream.close();
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		} /* finally */

		String commandName = properties.getProperty("/BoardListAction.do");
		System.out.println("commandName: " + commandName);

		Iterator<Object> keys = properties.keySet().iterator();
		while (keys.hasNext()) {
			String command = (String) keys.next(), className = properties.getProperty(command);
			try {
				Class clazz = Class.forName(className);
				Command commandInstance = (Command) clazz.newInstance();
				CommandMap.put(command, commandInstance);
			} catch (ClassNotFoundException | InstantiationException | IllegalAccessException e) {
				System.out.println(e.getMessage());
			}
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		command(request, response);

	}

	protected void command(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI(), contextPath = request.getContextPath(),
				command = requestURI.substring(contextPath.length()),
				className = command.substring(1, command.lastIndexOf(".do"));

		/* 문자셋 설정 */
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("<html><bodt>" + request.getRequestURL() + "<br />" + requestURI + "<br />" + contextPath + "<br />"
				+ command + "<br />" + className + "<br />" + "</body></html>");

		/* 요청 command에 따른 분기 작업 */
		Command action = (Command) CommandMap.get(command);
		String view = action.command(request, response);
		request.getRequestDispatcher(view).forward(request, response);
	}
}