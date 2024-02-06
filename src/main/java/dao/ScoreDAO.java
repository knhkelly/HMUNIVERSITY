package dao;

import java.sql.*;
import java.util.ArrayList;

import vo.ScoreBean;
import vo.StudentBean;

import static util.JdbcUtil.*;

public class ScoreDAO {
	public static ScoreDAO instance;
	Connection con;
	PreparedStatement pstmt;
	CallableStatement cstmt;
	ResultSet rs;

	public static ScoreDAO getInstance() {
		if (instance == null) {
			instance = new ScoreDAO(); }
		return instance;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}
	
	//성적입력
	public int scoreWrite(ScoreBean score) {
		String sql = "INSERT INTO score VALUES (?,?,?,  ?,?,?,  ?,?,?,  ?,?,?)";
		String sql2 = "{call TOTAL(?)}";
		
		int insertCount = 0;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, score.getStudent_no());
			pstmt.setString(2, score.getStudent_name());
			pstmt.setString(3, score.getStudent_dep());
			pstmt.setInt(4, score.getLecture_no());
			pstmt.setString(5, score.getLecture_name());
			pstmt.setInt(6, score.getScore_att());
			pstmt.setInt(7, score.getScore_mid());
			pstmt.setInt(8, score.getScore_final());
			pstmt.setInt(9, score.getScore_project());
			pstmt.setInt(10, score.getScore_subTotal());
			pstmt.setString(11, score.getScore_grade());
			pstmt.setString(12, score.getScore_completion());
			insertCount = pstmt.executeUpdate();
			
			cstmt = con.prepareCall(sql2);
			cstmt.setInt(1, score.getStudent_no());
			cstmt.executeUpdate();
			
		} catch (Exception ex) { System.out.println("scoreWrite 에러: " + ex);
		} finally { close(cstmt); close(pstmt); }

		return insertCount;
	}
		
	//성적 삭제
	public int scoreDelete(ScoreBean score) {
		String sql = "{call backup(?, ?)}";
		String sql2 = "{call TOTAL(?)}";
		
		int insertCount = 0;
			
		try {
			cstmt = con.prepareCall(sql);
			cstmt.setInt(1, score.getStudent_no());
			cstmt.setInt(2, score.getLecture_no());
			cstmt.executeUpdate();
				
			sql = "delete from score where student_no = ? and lecture_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, score.getStudent_no());
			pstmt.setInt(2, score.getLecture_no());
			insertCount = pstmt.executeUpdate();
			
			cstmt = con.prepareCall(sql2);
			cstmt.setInt(1, score.getStudent_no());
			cstmt.executeUpdate();
				
		} catch (Exception e) {System.out.println("scoreDelete 에러: " + e);}
		finally { close(cstmt); close(pstmt); }
			
		return insertCount;
	}
		
	//성적 수정
	public int scoreRewrite(ScoreBean score) {
		String sql = "update score set SCORE_ATT = ?, SCORE_MID = ?, SCORE_FINAL = ?, SCORE_PROJECT = ?, SCORE_SUBTOTAL = ?, SCORE_GRADE = ?, SCORE_COMPLETION = ? where STUDENT_NO = ? and lecture_no = ?";
		String sql2 = "{call TOTAL(?)}";
		
		int insertCount = 0;
					
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, score.getScore_att());
				pstmt.setInt(2, score.getScore_mid());
				pstmt.setInt(3, score.getScore_final());
				pstmt.setInt(4, score.getScore_project());
				pstmt.setInt(5, score.getScore_subTotal());
				pstmt.setString(6, score.getScore_grade());
				pstmt.setString(7, score.getScore_completion());
				pstmt.setInt(8, score.getStudent_no());
				pstmt.setInt(9, score.getLecture_no());
				insertCount = pstmt.executeUpdate();
				
				cstmt = con.prepareCall(sql2);
				cstmt.setInt(1, score.getStudent_no());
				cstmt.executeUpdate();
				
			} catch (Exception e) {System.out.println("scoreRewrite 에러: " + e);}
			finally { close(pstmt); close(cstmt); }
					
			return insertCount;
	}
	
	//성적(학생) 찾기
	public ArrayList<StudentBean> studentSearch(int option, String searchWord) {
		String sql = "";
		if(option == 01) {
	        sql = "select * from student where student_id like ?";
	    }else if(option == 02) {
	        sql = "select * from student where student_name like ?";
	    }else if(option == 03) {
		        sql = "select * from student where student_dep like ?";
	    }
		
		ArrayList<StudentBean> studentList = new ArrayList<StudentBean>();
		StudentBean searchResult = null;
		
		try {
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, "%"+searchWord+"%");
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                do {
                	searchResult = new StudentBean();
                	searchResult.setStudent_Id(rs.getInt("STUDENT_ID"));
                	searchResult.setStudent_Pw(rs.getString("STUDENT_PW"));
                	searchResult.setStudent_Name(rs.getString("STUDENT_NAME"));
                	searchResult.setStudent_Dep(rs.getString("STUDENT_DEP"));
                	searchResult.setStudent_Reg(rs.getString("STUDENT_REG"));
                	searchResult.setStudent_Gender(rs.getString("STUDENT_GENDER"));
                	
                	searchResult.setStudent_Mail(rs.getString("STUDENT_MAIL"));
                	searchResult.setStudent_Statu(rs.getString("STUDENT_STATU"));
                	searchResult.setStudent_Address(rs.getString("STUDENT_ADDRESS"));
                	searchResult.setStudent_Phone(rs.getString("STUDENT_PHONE"));
                	
                	studentList.add(searchResult);
                } while (rs.next());
            }
        } catch (Exception ex) {
            System.out.println("SearchList 에러 : " + ex);
        } finally {
            close(rs);
            close(pstmt);
        }
		return studentList;
	}
	
	
	public ArrayList<ScoreBean> selectUserScore(int student_Id){
		String sql = "SELECT LECTURE_NO, LECTURE_NAME, SCORE_SUBTOTAL, SCORE_GRADE, SCORE_COMPLETION FROM SCORE WHERE STUDENT_NO = ?";
		ArrayList<ScoreBean> scoreArr = null;
		ScoreBean score = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, student_Id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				scoreArr = new ArrayList<ScoreBean>();
				do {
					score = new ScoreBean();
					score.setLecture_no(rs.getInt("lecture_no"));
					score.setLecture_name(rs.getString("lecture_name"));
					score.setScore_subTotal(rs.getInt("score_subtotal"));
					score.setScore_grade(rs.getString("score_grade"));
					score.setScore_completion(rs.getString("score_completion"));
					scoreArr.add(score);
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return scoreArr;
	}
	
	public ScoreBean scoreView(int student_Id, int lecture_no) {
		String sql = "SELECT * FROM SCORE WHERE STUDENT_NO = ? AND LECTURE_NO = ?";
		ScoreBean score = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, student_Id);
			pstmt.setInt(2, lecture_no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				score = new ScoreBean();
				
				score.setStudent_no(rs.getInt(1));
				score.setStudent_name(rs.getString(2));
				score.setStudent_dep(rs.getString(3));
				score.setLecture_no(rs.getInt(4));
				score.setLecture_name(rs.getString(5));
				score.setScore_att(rs.getInt(6));
				score.setScore_mid(rs.getInt(7));
				score.setScore_final(rs.getInt(8));
				score.setScore_project(rs.getInt(9));
				score.setScore_subTotal(rs.getInt(10));
				score.setScore_grade(rs.getString(11));
				score.setScore_completion(rs.getString(12));
			}
			
		} catch(Exception e) { e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return score;
	}
	
	
	
}
