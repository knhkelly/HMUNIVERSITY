package util;

import java.sql.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class JdbcUtil {

	public static Connection getConnection(){
		Connection con=null;
		
		try {
			Context initCtx = new InitialContext();
			DataSource ds = (DataSource)initCtx.lookup("java:comp/env/jdbc/HmuLmsDB");
	  		
			con = ds.getConnection();
			con.setAutoCommit(false);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return con;
	}
	
	public static void close(Connection con){
		
		try {
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public static void close(Statement stmt){
		
		try { stmt.close(); }
		catch (Exception e) { e.printStackTrace(); }
		
	}
	
	public static void close(ResultSet rs){
		
		try { rs.close(); } 
		catch (Exception e) { e.printStackTrace(); }
		
	}
	
	public static void commit(Connection con){
		
		try {
			con.commit();
			System.out.println("커밋 성공 - 완성 후 삭제");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public static void rollback(Connection con){
		
		try {
			con.rollback();
			System.out.println("롤백 성공 - 완성후 삭제");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
