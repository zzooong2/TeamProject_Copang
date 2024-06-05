package kr.co.copang.common;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {

	private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String USER = "webadmin";
	private static final String PWD = "qwer1234!";
	private Connection con;

	public Connection connDB() {
		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PWD);
			return con;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
