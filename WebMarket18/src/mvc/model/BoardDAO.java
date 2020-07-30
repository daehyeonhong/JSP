package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import mvc.database.DBConnection;

/* DATA Access Object DAO */
public class BoardDAO {
	/* 자신 타입 Field */
	private static BoardDAO instance;

	/* Default Constructor 캡슐화 */
	private BoardDAO() {}

	/* 자신 타입의 Instance 제공 Method */
	public static BoardDAO getInstance() {
		return (instance == null) ? new BoardDAO() : instance;
	}

	/* 조회된 Board_Table의 record(row)건수 */
	public int getListCount(String items, String text) {
		/* DB접속 객체 생성 */
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		/* 조회 건수 저장 변수 선언 */
		int x = 0;

		/* 매개 변수로 넘어온 검색 조건과 검색 내용을 분석하여 쿼리 작성 */
		/* 검색 조건이 없을 때 */
		String sql = (items == null || text.trim().length() == 0) ? "select count(*) from board"
				: ("select count(*) from board where " + items + " like'%" + text + "%'");/* 검색 조건이 없을 때 */
		try {
			/* DB연결 하기 */
			connection = DBConnection.getInstance().getConnection();
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();

			x = (resultSet.next()) ? resultSet.getInt(1) : 0;
		} catch (Exception e) {
			System.out.println("getListCount()Error: " + e);
		} finally {
			try {
				if (resultSet != null) {
					resultSet.close();
				}
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		/* 조회건수 리턴 */
		return x;
	}

	/* 조회 목록 리턴 메소드 */
	public List<BoardDTO> getBoardList(int pageNum, int limit, String items, String text) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		/* 글 전체 건수 가져오기 */
		int total_record = getListCount(items, text),
				/* 시작 페이지의 글 번호 */
				start = (pageNum - 1) * limit, /* Parameter로 넘어온 Page와 Page당 건수를 곱하여 시작 글 번호 지정 */

				index = start + 1;

		/* 조건에 따른 쿼리문 생성 */
		/* 검색 조건이 없을 때 */
		String sql = (items == null || text.trim().length() == 0) ? "select*from board order by num desc" /* 최신글 정렬 */
				: ("select*from board where " + items + " like '%" + text + "%' order by num desc");

		/* view로 보낼 게시글 리스트객체 생성 */
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		try {
			connection = DBConnection.getInstance().getConnection();
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.absolute(index)) {
				BoardDTO board = new BoardDTO();
				/* board빈에 결과 값 설정 */
				board.setNum(resultSet.getInt("num"));
				board.setId(resultSet.getString("id"));
				board.setName(resultSet.getString("name"));
				board.setSubject(resultSet.getString("subject"));
				board.setContent(resultSet.getString("content"));
				board.setRegist_day(resultSet.getString("regist_day"));
				board.setHit(resultSet.getInt("hit"));
				board.setIp(resultSet.getString("ip"));

				/* 리스트에 추가 */
				list.add(board);

				/* 한 페이지 글 제한 갯수 이내면 증가 */
				if (index < (start + limit) && index <= total_record) {
					index++;
				} else {
					/* 한 페이지를 채우면 종료 */
					break;
				}
			}
		} catch (Exception e) {
			System.out.println("getBoardList()Error: " + e);
		} finally {
			try {
				if (resultSet != null) {
					resultSet.close();
				}
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		/* 조회된 게시글 리스트 리턴 */
		return list;
	}

}