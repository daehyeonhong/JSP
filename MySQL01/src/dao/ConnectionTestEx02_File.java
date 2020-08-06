/*
 * package dao;
 * 
 * import java.io.File; import java.io.FileReader; import java.sql.Connection;
 * import java.sql.DriverManager; import java.sql.SQLException; import
 * java.util.Properties;
 * 
 * public class ConnectionTestEx02_File { public static void main(String[] args)
 * { Connection connection = null; try { Class.forName("com.mysql.jdbc.Driver");
 * String path = "/dbconnection.properties", realPath =
 * application.getRealPath(path); out.print(realPath); File file = new
 * File(realPath); FileReader read = new FileReader(file); Properties properties
 * = new Properties(); properties.load(read);
 * 
 * properties.put("useSSL", "false"); properties.put("user", "root");
 * properties.put("password", "1234");
 * 
 * connection =
 * DriverManager.getConnection("jdbc:mysql://localhost:3306/WebMarketDB",
 * properties); System.out.println(connection != null ? "연결 성공!" : "연결 실패!"); }
 * catch (Exception e) { e.printStackTrace(); } finally { try {
 * connection.close(); } catch (SQLException e) { e.printStackTrace(); } } } }
 */