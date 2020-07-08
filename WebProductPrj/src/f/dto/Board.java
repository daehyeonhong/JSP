package f.dto;

public class Board {
	// field
	private int no;
	private String title, writer, content;

	// default_constructor
	public Board() {
	}

	// constructor
	public Board(int no, String title, String writer, String content) {
		this.no = no;
		this.title = title;
		this.writer = writer;
		this.content = content;
	}

	// method
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "Board [no=" + no + ", title=" + title + ", writer=" + writer + ", content=" + content + "]";
	}

}