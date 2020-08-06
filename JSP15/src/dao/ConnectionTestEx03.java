package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionTestEx03 {
	public static void main(String[] args) {
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/WebMarketDB?useSSL=false", "root",
					"1234");
			System.out.println(connection != null ? "연결 성공!" : "연결 실패!");
		} catch (Exception e) {
			e.getStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}