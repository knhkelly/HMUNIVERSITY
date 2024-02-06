package dao;

import static util.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.JdbcUtil;
import vo.LectureBean;
import vo.ScheduleBean;

public class ScheduleDAO {
	Connection con = JdbcUtil.getConnection();
	PreparedStatement pstmt;
	ResultSet rs;

	private static ScheduleDAO scheduleDAO;

	public static ScheduleDAO getInstance() {
		if (scheduleDAO == null) {
			scheduleDAO = new ScheduleDAO();
		}
		return scheduleDAO;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}

	public int scheduleInsertDao(ScheduleBean scheduleBean) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num = 0;
		String sql = "";
		int insertCount = 0;

		try {
			pstmt = con.prepareStatement("select max(schedule_num) from schedule");
			rs = pstmt.executeQuery();

			if (rs.next())
				num = rs.getInt(1) + 1;
			else
				num = 1;

			sql = "insert into schedule values (? , ?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, scheduleBean.getSchedule_content());

			insertCount = pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println("scheduleInsert 에러 : " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}

		return insertCount;
	}

	// 스케줄목록
	public ArrayList<ScheduleBean> selectScheduleList(){
		String sql = "SELECT * FROM SCHEDULE ORDER BY SCHEDULE_NUM DESC";
		ArrayList<ScheduleBean> scheduleList = null;
		ScheduleBean sb = null;
		try {
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				scheduleList = new ArrayList<ScheduleBean>();
				do {
					sb = new ScheduleBean();
					sb.setSchedule_num(rs.getInt("schedule_num"));
					sb.setSchedule_content(rs.getString("schedule_content"));
		
					scheduleList.add(sb);
				}while (rs.next());
			}
		}catch (Exception ex) {
			System.out.println("getScheduleList 에러: " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}
	return scheduleList;
}

	// 스케줄 삭제
	public int deleteSchedule(int num) {
		String sql = "DELETE Schedule WHERE Schedule_num=?";
		int deleteCount = 0;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			deleteCount = pstmt.executeUpdate();
		}catch(Exception ex) {
			System.out.println("deleteSchedule 에러 : " + ex);
		}finally {
			close(pstmt);
		}
		System.out.println("김세현맹구 : "+deleteCount);
		return deleteCount;
	}
}