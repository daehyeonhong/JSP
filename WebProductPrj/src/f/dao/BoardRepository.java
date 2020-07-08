package f.dao;

import java.util.ArrayList;
import java.util.List;

import f.dto.Board;

public class BoardRepository {
	// List
	private List<Board> BoardList = new ArrayList<Board>();
	private static BoardRepository instance = new BoardRepository();

	// defaultConstructor
	public BoardRepository() {
		Board board1 = new Board(1, "글제목1", "홍길동", "첫번째 글 내용");
		Board board2 = new Board(2, "글제목2", "일지매", "두번째 글 내용");
		Board board3 = new Board(3, "글제목3", "임꺽정", "세번째 글 내용");
		BoardList.add(board1);
		BoardList.add(board2);
		BoardList.add(board3);
	}

	// Board 객체를 저장한 List 출력하는 Method
	public List<Board> getBoardList() {
		return BoardList;
	}

	public static BoardRepository getInstance() {
		return instance;
	}
}