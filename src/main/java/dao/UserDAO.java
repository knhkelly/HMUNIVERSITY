package dao;

import static util.JdbcUtil.close;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import vo.LectureBean;
import vo.ScoreBean;
import vo.StudentBean;
import vo.StudentImgBean;

public class UserDAO {

	// 연결 객체, 인스턴스 관련

		public static UserDAO instance;
		Connection con;
		PreparedStatement pstmt;
		CallableStatement cstmt;
		ResultSet rs;
	
		public static UserDAO getInstance() {
			if (instance == null) {
				instance = new UserDAO();
			}
			return instance;
		}
	
		public void setConnection(Connection con) {
			this.con = con;
		}

		// DB 관련

		// 학생 개인정보 끌어오기
		public StudentBean selectStudent(int student_Id) {
			String sql = "SELECT * FROM STUDENT WHERE STUDENT_ID = ?";
			StudentBean sb = null;
	
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, student_Id);
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

		// 내 과목 보여주면서 성적도 같이 보여주기
		public ArrayList<LectureBean> userSubject(int student_Id) {
			String sql = "SELECT LECTURE.* FROM LECTURE, SCORE WHERE LECTURE.LECTURE_NO = SCORE.LECTURE_NO AND SCORE.STUDENT_NO = ?";
			ArrayList<LectureBean> alb = null;
			LectureBean lb = null;
	
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, student_Id);
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
				close(rs);
				close(pstmt);
			}
			return alb;
		}

		// 유저 개인정보 업데이트
		public int updateUser(StudentBean student) {
			String sql = "UPDATE STUDENT SET STUDENT_PW = ?, STUDENT_MAIL = ?, STUDENT_ADDRESS = ?, STUDENT_PHONE = ? where student_id = ?";
	
			int updateCount = 0;
	
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, student.getStudent_Pw());
				pstmt.setString(2, student.getStudent_Mail());
				pstmt.setString(3, student.getStudent_Address());
				pstmt.setString(4, student.getStudent_Phone());
				pstmt.setInt(5, student.getStudent_Id());
	
				updateCount = pstmt.executeUpdate();
	
			} catch (Exception ex) {
				System.out.println("updateStudent 에러 : " + ex);
			} finally {
				close(pstmt);
			}
			return updateCount;
		}
		
		// 수강신청하기
		public int insertSubject(ScoreBean score) {
			String sql = "INSERT INTO SCORE(STUDENT_NO,STUDENT_NAME,STUDENT_DEP,LECTURE_NO,LECTURE_NAME)"
					+ " VALUES (?, ?, ?, ?, ?)";
			String sql2 = "{call TOTAL(?)}";
			int insertCount = 0;

			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, score.getStudent_no());
				pstmt.setString(2, score.getStudent_name());
				pstmt.setString(3, score.getStudent_dep());
				pstmt.setInt(4, score.getLecture_no());
				pstmt.setString(5, score.getLecture_name());

				insertCount = pstmt.executeUpdate();
				
				cstmt = con.prepareCall(sql2);
				cstmt.setInt(1, score.getStudent_no());
				cstmt.executeUpdate();
			} catch (Exception ex) {
				ex.printStackTrace();
			} finally {
				close(cstmt);
				close(pstmt);
			}
			return insertCount;
		}
		
		// 수강신청한 과목 취소하기
		public int deleteSubject(int student_Id, int lecture_no) {
			String sql = "DELETE FROM SCORE WHERE STUDENT_NO = ? AND LECTURE_NO = ?";
			String sql2 = "{call TOTAL(?)}";
			int deleteCount = 0;

			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, student_Id);
				pstmt.setInt(2, lecture_no);
				deleteCount = pstmt.executeUpdate();
				
				cstmt = con.prepareCall(sql2);
				cstmt.setInt(1, student_Id);
				cstmt.executeUpdate();
			} catch (Exception ex) {
				ex.printStackTrace();
			} finally {
				close(cstmt);
				close(pstmt);
			}
			return deleteCount;
		}
		
		public ArrayList<LectureBean> layoutLectures(int student_Id){
			String sql = "SELECT LECTURE_NAME, LECTURE_PRO, LECTURE_TIME, LECTURE_CP FROM LECTURE WHERE LECTURE_NAME IN (SELECT LECTURE_NAME FROM SCORE WHERE STUDENT_NO = ?)";
			ArrayList<LectureBean> alb = null;
			LectureBean lb = null;
			
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, student_Id);
				rs = pstmt.executeQuery();
	
				if (rs.next()) {
					alb = new ArrayList<LectureBean>();
					do {
						lb = new LectureBean();
						lb.setLecture_name(rs.getString("LECTURE_NAME"));
						lb.setLecture_pro(rs.getString("LECTURE_PRO"));
						lb.setLecture_time(rs.getString("LECTURE_TIME"));
						lb.setLecture_cp(rs.getString("LECTURE_CP"));
						alb.add(lb);
					} while (rs.next());
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstmt);
			}
			return alb;
		}
		
		public StudentImgBean pictureSrc(int student_Id) {
			String sql = "SELECT IMGSRC FROM IMGSRC WHERE STUDENT_ID = ?";
			StudentImgBean img = null;
			
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, student_Id);
				rs = pstmt.executeQuery();
				
				img = new StudentImgBean();
				if (rs.next()) {
				
					img.setImgSrc(rs.getString("IMGSRC"));
				}
			} catch (Exception ex) {
				System.out.println("getDetailStudent 에러 : " + ex);
			} finally {
				close(rs);
				close(pstmt);
			}
			
			return img;
		}
		
		public ArrayList<ScoreBean> insertVaild(int student_No) {
			String sql = "SELECT LECTURE_NO FROM SCORE WHERE STUDENT_NO = ?";
			ArrayList<ScoreBean> lecno = null;
			ScoreBean score = null;
			
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, student_No);
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					lecno = new ArrayList<ScoreBean>();
					do {
						score = new ScoreBean();
						score.setLecture_no(rs.getInt("LECTURE_NO"));
						lecno.add(score);
					} while (rs.next());
				}
			} catch (Exception ex) {
				System.out.println("getDetailStudent 에러 : " + ex);
			} finally {
				close(rs);
				close(pstmt);
			}
			return lecno;
		}


}
