package com.ecommerce.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySQLConnUtils {

	public static Connection getMySQLConnection() throws ClassNotFoundException, SQLException  {
		
		// TODO Auto-generated method stub
		
		String hostName = "localhost";
		String userName = "wawa";
		String password = "mypass!@#";
		String dbName = "ecommerce";
		return getMySQLConnection(hostName, dbName, userName, password);
	}
	public static Connection getMySQLConnection(String hostName, String dbName, String userName, String password)
			throws SQLException, ClassNotFoundException {
		
		// JDBC connection driver
		Class.forName("com.mysql.jdbc.Driver");

		// URL Connection for MySQL:
		String connectionURL = "jdbc:mysql://" + hostName + ":3306/" + dbName;

		Connection conn = DriverManager.getConnection(connectionURL, userName, password);
		return conn;
		}
}
