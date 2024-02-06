package dao;

import static util.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.JdbcUtil;
import vo.MiniBoardBean;

public class MiniBoardDAO {
	Connection con = JdbcUtil.getConnection();
	PreparedStatement pstmt;
	ResultSet rs;
	
	private static MiniBoardDAO miniBoardDAO;
		
	public static MiniBoardDAO getInstance(){
		if(miniBoardDAO == null){ miniBoardDAO = new MiniBoardDAO(); }
		return miniBoardDAO;
	}
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	
	public int insert(MiniBoardBean miniBoardBean){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num =0;
		String sql="";
		int insertCount=0;

		try{
			pstmt=con.prepareStatement("select max(MINI_NUM) from miniboard");
			rs = pstmt.executeQuery();

			if(rs.next())
				num =rs.getInt(1)+1;
			else
				num=1;

			sql="insert into miniboard values (? , ?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, miniBoardBean.getMINI_CONTENT());

			insertCount=pstmt.executeUpdate();

		}catch(Exception ex){
			System.out.println("miniBoardInsert 에러 : "+ex);
		}finally{
			close(rs);
			close(pstmt);
		}

		return insertCount;
	}
}
