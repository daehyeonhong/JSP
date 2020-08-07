package mvc.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.model.BoardDAO;
import mvc.model.BoardDTO;

public class BoardUpdateAction implements Command {
	@Override
	public String command(HttpServletRequest request, HttpServletResponse response) {
		requestBoardUpdate(request);
		return "\"BoardListAction.do\"";
	}

	/* Update정보 DB에 저장 */
	private void requestBoardUpdate(HttpServletRequest request) {
		BoardDAO dao = BoardDAO.getInstance();
		/* List로 되돌아갈 때 원래 Page로 가기 위한 값 */
		int num = Integer.parseInt(request.getParameter("num")),
				pageNum = Integer.parseInt(request.getParameter("pageNum"));

		/* DB에서 정보 얻기 */
		BoardDTO board = new BoardDTO();
		board.setNum(num);
		board.setSubject(request.getParameter("subject"));
		board.setContent(request.getParameter("content"));

		String regist_day = new SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)").format(new Date());
		System.out.println(regist_day);
		board.setRegist_day(regist_day);
		board.setIp(request.getRemoteAddr());/* IP주소 */

		dao.updateBoard(board);

		/* View로 정보를 넘기기 위한 설정 */
		request.setAttribute("num", num);
		request.setAttribute("page", pageNum);
		request.setAttribute("board", board);
	}
}