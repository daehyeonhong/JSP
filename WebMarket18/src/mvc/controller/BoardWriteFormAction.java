package mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.model.BoardDAO;

public class BoardWriteFormAction implements Command {

	@Override
	public String command(HttpServletRequest request, HttpServletResponse response) {
		requestGetName(request);
		return "./board/writeForm.jsp";
	}

	private void requestGetName(HttpServletRequest request) {
		String id = request.getParameter("id");
		BoardDAO dao = BoardDAO.getInstance();
		String name = dao.getNameById(id);
		request.setAttribute("name", name);
	}
}