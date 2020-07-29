package mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.model.BoardDAO;
import mvc.model.BoardDTO;

public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final int LISTCOUNT = 5;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/* URL로 부터 요청 정보 얻기 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI(),
				contextPath = request.getContextPath(),
				command = requestURI.substring(contextPath.length());

		/* 문자셋 설정 */
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("<html><bodt>" + request.getRequestURL() + "<br />" + requestURI + "<br />" + contextPath + "<br />"
				+ command + "<br />" + "</body></html>");

		/* 요청 command에 따른 분기 작업 */
		RequestDispatcher requestDispatcher = null;

		/*
		 * if (command.equals("/BoardListAction.do")) { DB에서 조회한 글 List를 request에 저장
		 * requestDispatcher = request.getRequestDispatcher("./board/list.jsp"); } else
		 * if (command.equals("/BoardWriteFormAction.do")) { requestDispatcher =
		 * request.getRequestDispatcher("./board/writeForm.jsp"); } else if
		 * (command.equals("/BoardWriteAction.do")) { form에서 넘어온 새 글 DB 저장 DB에 저장된 List
		 * 조회한 후 request에 저장 requestDispatcher =
		 * request.getRequestDispatcher("BoardListAction.do"); }
		 */

		switch (command) {
		case "/BoardListAction.do":
			/* DB에서 조회한 글 List를 request에 저장 */
			requestBoardList(request);
			requestDispatcher = request.getRequestDispatcher("./board/list.jsp");
			break;
		case "/BoardWriteFormAction.do":
			requestDispatcher = request.getRequestDispatcher("./board/writeForm.jsp");
			break;
		case "/BoardWriteAction.do":
			/* form에서 넘어온 새 글 DB 저장 */
			/* DB에 저장된 List 조회한 후 request에 저장 */
			requestDispatcher = request.getRequestDispatcher("BoardListAction.do");
			break;
		default:
			requestDispatcher = request.getRequestDispatcher("/exceptionNoPage.jsp");
			break;
		}
		requestDispatcher.forward(request, response);
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

		/* 전체 글 건수 % Page당 글 갯수 == 나머지 || 0 */
		/*
		 * if (total_page % limit == 0) { 나머지가 없는 경우 total_page = total_record / limit;
		 * Math.floor(total_page); } else { 나머지가 있는 경우 total_page = total_record /
		 * limit; Math.floor(total_page); total_page = total_page + 1; }
		 */
		total_page = total_record / limit;
		Math.floor(total_page);
		total_page = (total_page % limit == 0) ? total_page : (total_page + 1);

		/* 결과를 view에 전달하기 위해 request에 저장 */
		request.setAttribute("pageNum", pageNum); /* 페이지 번호 */
		request.setAttribute("total_page", total_page); /* 전체 페이지 수 */
		request.setAttribute("total_record", total_record); /* 전체 건수 */
		request.setAttribute("boardList", boardList); /* 해당 Page에 출력할 글 목록 */
		/* 검색 조건 추가에 따른 조건, 검색내용 추가 전달 */
		request.setAttribute("items", items);
		request.setAttribute("text", text);
	}

}