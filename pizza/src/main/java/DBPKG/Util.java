package DBPKG;

import java.sql.Connection;
import java.sql.DriverManager;

public class Util {
	public static Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/Xe", "system", "1234");
		return conn;
	}
}