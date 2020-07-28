package mvc.model;

public class BoardDTO {
	/* Table의 [Column_Name]_Type과 같은 속성 선언 */
	private int num;/* 순번 */
	private String id/* 작성자ID */, name/* 작성자 이름 */, subject/* 제목 */, content/* 내용 */, regist_day/* 등록일자 */,
			ip/* IP주소 */;

	/* Constructor */
	public BoardDTO() {}

	/* [Getter/Setter_Method] */
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegist_day() {
		return regist_day;
	}

	public void setRegist_day(String regist_day) {
		this.regist_day = regist_day;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

}