package mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardView implements Command {
	@Override
	public String command(HttpServletRequest request, HttpServletResponse response) {
		return "./board/view.jsp";
	}
}