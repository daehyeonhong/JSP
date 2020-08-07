package mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.model.BoardDAO;
import mvc.model.BoardDTO;

public class BoardViewAction implements Command {

	@Override
	public String command(HttpServletRequest request, HttpServletResponse response) {
		requestBoardView(request);
		return "/BoardView.do";
	}

	/* 글 상세 페이지 가져오기 */
	private void requestBoardView(HttpServletRequest request) {
		BoardDAO dao = BoardDAO.getInstance();
		/* List로 되돌아갈 때 원래 Page로 가기 위한 값 */
		int num = Integer.parseInt(request.getParameter("num")),
				pageNum = Integer.parseInt(request.getParameter("pageNum"));

		/* DB에서 정보 얻기 */
		BoardDTO board = new BoardDTO();
		board = dao.getBoardByNum(num, pageNum);

		/* View로 정보를 넘기기 위한 설정 */
		request.setAttribute("num", num);
		request.setAttribute("page", pageNum);
		request.setAttribute("board", board);
	}
}