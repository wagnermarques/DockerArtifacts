package test;

import java.sql.Connection;

import java.sql.SQLException;
import java.util.Properties;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NameClassPair;
import javax.naming.NamingEnumeration;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ConnFactory {

	private static Connection conn;

	public static Connection getConnection() {
		if (null != conn) {
			return conn;
		} else {
			conn = createConnection();
		}
		return conn;
	}

	// https://jdbc.postgresql.org/documentation/head/connect.html
	private static Connection createConnection() {
		Connection c = null;
		// http://tomcat.apache.org/tomcat-8.5-doc/jndi-datasource-examples-howto.html
		InitialContext cxt;
		DataSource ds; 
		try {
		    //Class.forName("org.postgresql.Driver").newInstance();
			cxt = new InitialContext();
			
			Context envContext = (Context)cxt.lookup("java:/comp/env");
			ds = (DataSource) envContext.lookup("jdbc/postgresql");
			c = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return c;
	}
}
