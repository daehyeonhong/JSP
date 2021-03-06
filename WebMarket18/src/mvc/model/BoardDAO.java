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
			while (resultSet.absolute(index)) {/* 한 행씩 전진 */
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

	public String getNameById(String id) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		String name = "";
		try {
			connection = DBConnection.getInstance().getConnection();
			String sql = "select name from member where id=?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, id);
			resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				name = resultSet.getString(1);
			}
		} catch (Exception e) {
			System.out.println("getNameById()Error: " + e);
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
		return name;
	}

	public void insertBoard(BoardDTO board) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			/* Query_Object */
			connection = DBConnection.getInstance().getConnection();
			String sql = "insert into board(id,name,subject,content,regist_day,hit,ip)values(?,?,?,?,?,?,?)";
			preparedStatement = connection.prepareStatement(sql);
			
			/* Parameter */
			preparedStatement.setString(1, board.getId());
			preparedStatement.setString(2, board.getName());
			preparedStatement.setString(3, board.getSubject());
			preparedStatement.setString(4, board.getContent());
			preparedStatement.setString(5, board.getRegist_day());
			preparedStatement.setInt(6, board.getHit());
			preparedStatement.setString(7, board.getIp());
			
			/* Update */
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			System.out.println("insertBoard()Error: " + e);
		} finally {
			try {
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
	}

	public BoardDTO getBoardByNum(int num, int pageNum) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		BoardDTO board = null;
		/* 조회 수 증가 처리 */
		updateHit(num);
		try {
			/* Query_Object */
			connection = DBConnection.getInstance().getConnection();
			String sql = "select*from board where num=?";
			preparedStatement = connection.prepareStatement(sql);
			
			/* Parameter */
			preparedStatement.setInt(1, num);

			/* Update */
			resultSet = preparedStatement.executeQuery();
			
			if (resultSet.next()) {
				board = new BoardDTO();
				board.setNum(resultSet.getInt("num"));
				board.setId(resultSet.getString("id"));
				board.setName(resultSet.getString("name"));
				board.setSubject(resultSet.getString("Subject"));
				board.setContent(resultSet.getString("content"));
				board.setRegist_day(resultSet.getString("regist_day"));
				board.setHit(resultSet.getInt("hit"));
				board.setIp(resultSet.getString("ip"));
			}
		} catch (Exception e) {
			System.out.println("getBoardByNum()Error: " + e);
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
		/* Board Return */
		return board;
	}

	/* 조회 수 증가 Method */
	public void updateHit(int num) {
		/* DB ConnectObject */
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			/* DB 연결하기 */
			connection = DBConnection.getInstance().getConnection();
			/* Query문 작성 */
			String sql = "update board set hit=hit+1 where num=?";
			/* Query객체 생성 */
			preparedStatement = connection.prepareStatement(sql);
			/* 바인딩 변수 처리 */
			preparedStatement.setInt(1, num);
			/* DB Update 처리 */
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateHit()Error: " + e);
		} finally {
			try {
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
	}
	
	public void updateBoard(BoardDTO board) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			/* Query_Object */
			connection = DBConnection.getInstance().getConnection();
			String sql = "update board set subject=?,content=?,regist_day=?,ip=? where num=?";
			preparedStatement = connection.prepareStatement(sql);
			
			/* Parameter */
			preparedStatement.setString(1, board.getSubject());
			preparedStatement.setString(2, board.getContent());
			preparedStatement.setString(3, board.getRegist_day());
			preparedStatement.setString(4, board.getIp());
			preparedStatement.setInt(5, board.getNum());
			
			/* Update */
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateBoard()Error: " + e);
		} finally {
			try {
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
	}

	/* DB에서 해당 글 번호로 삭제 처리 */
	public void deleteBoard(int num) {
		/* DB연결 객체 생성 */
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			/* DB 연결하기 */
			connection = DBConnection.getInstance().getConnection();
			String sql = "delete from board where num=?";
			/* 쿼리객체 생성 */
			preparedStatement = connection.prepareStatement(sql);
			/*바인딩 변수 설정*/
			preparedStatement.setInt(1, num);
			/*삭제 쿼리 실행*/
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			System.out.println("deleteBoard()Error: " + e);
		} finally {/* 자원 해제 처리 */
			try {
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
	}
}