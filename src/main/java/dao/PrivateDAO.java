package dao;

import static util.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.LectureBean;
import vo.PrivateBean;
import vo.ScoreBean;
import vo.StudentBean;
import vo.TotalScoreBean;

public class PrivateDAO {
	public static PrivateDAO instance;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	public static PrivateDAO getInstance() {
		if (instance == null) {
			instance = new PrivateDAO();
		}
		return instance;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}

	public int insertSubject(ScoreBean scorebean) {
		String sql = "INSERT INTO SCORE(STUDENT_NO,STUDENT_NAME,LECTURE_NO,LECTURE_NAME)"
				+ " VALUES (?, ?, ?, ?)";
		int insertCount = 0;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, scorebean.getStudent_no());
			pstmt.setString(2, scorebean.getStudent_name());
			pstmt.setInt(3, scorebean.getLecture_no());
			pstmt.setString(4, scorebean.getLecture_name());

			insertCount = pstmt.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			close(pstmt);
		}
		return insertCount;
	}

	public int deleteSubject(int student_Id, int lecture_no) {
		String sql = "DELETE FROM SCORE WHERE STUDENT_NO = ? AND LECTURE_NO = ?";
		int deleteCount = 0;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, student_Id);
			pstmt.setInt(2, lecture_no);
			deleteCount = pstmt.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			close(pstmt);
		}
		return deleteCount;
	}

//	잘못만들었지만 나중엔
//	쓸거같으니 일단 둡시다!.....ㅠ

	public ArrayList<TotalScoreBean> selectScoreList(int id) {
		String sql = "SELECT * FROM TOTALSCORE WHERE STUDENT_ID = ?";
		ArrayList<TotalScoreBean> scoreList = null;
		TotalScoreBean mb = null;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				scoreList = new ArrayList<TotalScoreBean>();
				do {
					mb = new TotalScoreBean();
					mb.setStudent_id(rs.getInt("student_id"));
					mb.setStudent_name(rs.getString("student_name"));
					mb.setStudent_dep(rs.getString("student_dep"));
					mb.setScore_application(rs.getInt("score_application"));
					mb.setScore_get(rs.getInt("score_get"));
					mb.setScore_sub(rs.getInt("Score_sub"));
					mb.setScore_main(rs.getInt("score_main"));
					mb.setScore_total(rs.getInt("score_total"));
					mb.setScore_avgTotal(rs.getInt("score_avgTotal"));
					scoreList.add(mb);
				} while (rs.next());
			}

		} catch (Exception ex) {
			System.out.println("getListScore 오류 : " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}
		return scoreList;
	}

	// 회원 목록, 학생 정보에 당겨다가 쓰면 될듯
	public StudentBean selectStudent(int id) {
		String sql = "SELECT * FROM STUDENT WHERE STUDENT_ID = ?";
		StudentBean sb = null;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				sb = new StudentBean();
				sb.setStudent_Id(rs.getInt("STUDENT_ID"));
				sb.setStudent_Pw(rs.getString("STUDENT_PW"));
				sb.setStudent_Name(rs.getString("STUDENT_NAME"));
				sb.setStudent_Dep(rs.getString("STUDENT_DEP"));
				sb.setStudent_Reg(rs.getString("STUDENT_REG"));
				sb.setStudent_Gender(rs.getString("STUDENT_GENDER"));
				sb.setStudent_Mail(rs.getString("STUDENT_MAIL"));
				sb.setStudent_Statu(rs.getString("STUDENT_STATU"));
				sb.setStudent_Address(rs.getString("STUDENT_ADDRESS"));
				sb.setStudent_Phone(rs.getString("STUDENT_PHONE"));
			}
		} catch (Exception ex) {
			System.out.println("getDetailStudent 에러 : " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return sb;
	}

	
	public ArrayList<LectureBean> selectSubject(String lecture_name) {
		String sql = "SELECT * FROM LECTURE WHERE LECTURE_NAME = ?";
		ArrayList<LectureBean> alb = null;
		LectureBean lb = null;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, lecture_name);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				alb = new ArrayList<LectureBean>();
				do {
					lb = new LectureBean();
					lb.setLecture_no(rs.getInt("lecture_no"));
					lb.setLecture_name(rs.getString("lecture_name"));
					lb.setLecture_pro(rs.getString("lecture_pro"));
					lb.setLecture_grade(rs.getInt("lecture_grade"));
					lb.setLecture_dep(rs.getString("lecture_dep"));
					lb.setLecture_category(rs.getString("lecture_category"));
					lb.setLecture_score(rs.getInt("lecture_score"));
					lb.setLecture_nop(rs.getInt("lecture_nop"));
					lb.setLecture_time(rs.getString("lecture_time"));
					lb.setLecture_semester(rs.getString("lecture_semester"));
					lb.setLecture_cp(rs.getString("lecture_cp"));
					lb.setLecture_lp(rs.getString("lecture_lp"));

					alb.add(lb);
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return alb;
	}
	
	
	public ArrayList<LectureBean> userSubject(int student_Id){
		String sql = "SELECT LECTURE.* FROM LECTURE, SCORE WHERE LECTURE.LECTURE_NO = SCORE.LECTURE_NO AND SCORE.STUDENT_NO = ?";
		ArrayList<LectureBean> alb = null;
		LectureBean lb = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, student_Id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				alb = new ArrayList<LectureBean>();
				
				do {
					lb = new LectureBean();
					lb.setLecture_no(rs.getInt("lecture_no"));
					lb.setLecture_name(rs.getString("lecture_name"));
					lb.setLecture_pro(rs.getString("lecture_pro"));
					lb.setLecture_grade(rs.getInt("lecture_grade"));
					lb.setLecture_dep(rs.getString("lecture_dep"));
					lb.setLecture_category(rs.getString("lecture_category"));
					lb.setLecture_score(rs.getInt("lecture_score"));
					lb.setLecture_nop(rs.getInt("lecture_nop"));
					lb.setLecture_time(rs.getString("lecture_time"));
					lb.setLecture_semester(rs.getString("lecture_semester"));
					lb.setLecture_cp(rs.getString("lecture_cp"));
					lb.setLecture_lp(rs.getString("lecture_lp"));

					alb.add(lb);
				} while (rs.next());
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
//		public int userUpdate() {
//			
//		}
	
		return alb;
	}

}