package mvc.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.model.BoardDAO;
import mvc.model.BoardDTO;

public class BoardWriteAction implements Command {

	@Override
	public String command(HttpServletRequest request, HttpServletResponse response) {
		requestBoardWrite(request);
		return "BoardListAction.do";
	}

	private void requestBoardWrite(HttpServletRequest request) {
		/* DB 저장 객체 생성 */
		String regist_day = new SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)").format(new Date());
		BoardDAO dao = BoardDAO.getInstance();

		BoardDTO board = new BoardDTO();
		board.setId(request.getParameter("id"));
		board.setName(request.getParameter("name"));
		board.setSubject(request.getParameter("subject"));
		board.setContent(request.getParameter("content"));
		board.setHit(0);
		board.setRegist_day(regist_day);
		board.setIp(request.getRemoteAddr());/* IP주소 */

		dao.insertBoard(board);
	}
}