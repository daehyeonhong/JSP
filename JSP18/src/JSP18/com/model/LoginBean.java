package JSP18.com.model;

public class LoginBean {
	/* 속성(property) */
	private String id, password;

	/* 기본 생성자(Default_Constructor) */
	public LoginBean() {}

	/* [Getters/Setter_Method] */
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	/* 추가 Method */
	public boolean validate() {
		return password.equals("admin");
	}
}