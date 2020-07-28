package mvc.database;

import java.sql.Connection;
import java.sql.DriverManager;

/* Singleton 으로 작성 */
public class DBConnection {
	/* 자기 자신 타입의 instance_Field */
	private static DBConnection instance = new DBConnection();

	/* Constructor 캡슐화 */
	private DBConnection() {
	}

	/* instance 얻기 */
	public static DBConnection getInstance() {
		return instance;
	}

	/* 외부 접근 가능한 getConnection_Method() */
	public Connection getConnection() {
		Connection connection = null;
		String url = "jdbc:mysql://localhost:3306/WebMarketDB?useSSL=false", user = "root", password = "1234";
		try {
			/* 드라이버 메모리에 로딩 */
			Class.forName("com.mysql.jdbc.Driver");

			/* 연결 맺기 */
			connection = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return connection;
	}
}