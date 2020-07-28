package JSP18.com.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import dao.ConnectionTestEx01;

public class LoginBean {
	/* 속성(property) */
	private String id, password;

	/* 기본 생성자(Default_Constructor) */
	public LoginBean() {
	}

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
		ConnectionTestEx01 connectionTestEx01 = new ConnectionTestEx01();
		Connection connection = connectionTestEx01.getConnection();
		String sql = "select password from member where id=?";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				return password.equals(resultSet.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}