package mvc.database;

public class DBTest {
	public static void main(String[] args) {
		DBConnectionProperties dbConnectionProperties = DBConnectionProperties.getInstance();
		dbConnectionProperties.getConnection();
		System.out.println((dbConnectionProperties != null) ? "연결 성공!!" : "연결 실패!!");
	}
}