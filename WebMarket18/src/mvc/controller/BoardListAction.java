package mvc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.model.BoardDAO;
import mvc.model.BoardDTO;

public class BoardListAction implements Command {
	static final int LISTCOUNT = 5;

	@Override
	public String command(HttpServletRequest request, HttpServletResponse response) {
		requestBoardList(request);
		return "./board/list.jsp";
	}

	/* 등록된 글 목록 가져오기 */
	private void requestBoardList(HttpServletRequest request) {
		/* DB와 접속하여 데이터를 가져오는 객체 */
		BoardDAO dao = BoardDAO.getInstance();
		/* DB로부터 가져온 게시글 정보를 담을 List 생성 */
		List<BoardDTO> boardList = new ArrayList<BoardDTO>();
		/* 출력할 게시글의 초기화 작업 */
		int pageNum = 1;/* 최초 페이지는 1Page로 설정 */
		int limit = LISTCOUNT;/* 한 페이지당 출력 갯수 설정: 5 */
		/* int segment = 3; */
		/* PageList에서 해당 Page를 클릭했을 때 해당 Page가 넘어옴 */
		if (request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		/* 검색 조건을 받는 변수 선언 */
		String items = request.getParameter("items"), text = request.getParameter("text");
		/* 조회된 전체 글의 수 */
		int total_record = dao.getListCount(items, text);
		/* 검색 내용과 페이지번호, 페이지당 글 갯수(5), 검색 조건 */
		boardList = dao.getBoardList(pageNum, limit, items, text);

		/* 검색에 의해 조회된 전체 페이지 수 */
		int total_page;

		total_page = total_record / limit;
		Math.floor(total_page);
		total_page = (total_record % limit == 0) ? total_page : (total_page + 1);

		/* segment 단위로 페이지 처리하기 */
		int pageLength = 5,
				currentBlock = (pageNum % pageLength == 0) ? (pageNum / pageLength) : (pageNum / pageLength + 1),
				/* 현재 화면에 보여지는 Page의 첫째 Page번호 */
				startPage = 1 + (currentBlock - 1) * pageLength, /* 1, 6 */
				endPage = startPage + pageLength - 1, /* 5, 10 */
				total_segment = (total_record % (limit * pageLength) == 0) ? (total_record / (limit * pageLength))
						: (total_record / (limit * pageLength) + 1);
		/* 글 조회 후 마지막 Page 보정 */
		endPage = endPage > total_page ? total_page : endPage;

		/* 결과를 view에 전달하기 위해 request에 저장 */
		request.setAttribute("pageNum", pageNum); /* 페이지 번호 */
		request.setAttribute("total_page", total_page); /* 전체 페이지 수 */
		request.setAttribute("total_record", total_record); /* 전체 건수 */
		request.setAttribute("boardList", boardList); /* 해당 Page에 출력할 글 목록 */
		/* 검색 조건 추가에 따른 조건, 검색내용 추가 전달 */
		request.setAttribute("items", items);
		request.setAttribute("text", text);
		/* segment 처리 Parameter 설정 */
		request.setAttribute("currentBlock", currentBlock);/* 현재 화면의 Block */
		request.setAttribute("startPage", startPage);/* 현재 화면의 시작 Page */
		request.setAttribute("endPage", endPage);/* 현재 화면의 끝 Page */
		request.setAttribute("total_segment", total_segment);/* 전체 Block 수 */
	}
}