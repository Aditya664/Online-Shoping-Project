package project;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBClass {
	public static Connection getCon() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/osjsp", "root", "root");
			return con;
		} catch (Exception e) {
			System.out.print("Error: " + e.getMessage());
			return null;
		}
	}
}
