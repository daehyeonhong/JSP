package mvc.database;

import java.io.File;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

/* Singleton 으로 작성 */
public class DBConnectionProperties {
	/* 자기 자신 타입의 instance_Field */
	private static DBConnectionProperties instance = new DBConnectionProperties();

	/* Constructor 캡슐화 */
	private DBConnectionProperties() {
	}

	/* instance 얻기 */
	public static DBConnectionProperties getInstance() {
		return instance;
	}

	/* 외부 접근 가능한 getConnection_Method() */
	public Connection getConnection() {
		Connection connection = null;
		String url = "", user = "", password = "";

		try {
			/* File 정보 얻기 */
			File file = new File("C:\\WorkSpace\\JSP\\WebMarket18\\src\\DBConnection.properties");
			/* 속성, 값 저장할 객체 생성 */
			Properties properties = new Properties();
			/* 파일 정보 읽을 통로 생성 */
			FileReader fileReader = new FileReader(file);
			/* 저장 */
			properties.load(fileReader);

			url = properties.getProperty("url");
			user = properties.getProperty("user");
			password = properties.getProperty("password");
			/* 드라이버 메모리에 로딩 */
			Class.forName(properties.getProperty("driver"));

			/* 연결 맺기 */
			connection = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(url);
		System.out.println(user);
		System.out.println(password);
		return connection;
	}
}