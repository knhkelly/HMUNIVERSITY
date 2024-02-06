package dao;

import static util.JdbcUtil.close;

import java.sql.*;
import java.util.ArrayList;
import util.JdbcUtil;
import vo.LectureBean;

public class LectureDAO {
	Connection con = JdbcUtil.getConnection();
	PreparedStatement pstmt;
	ResultSet rs;
	
	private static LectureDAO lectureDAO;
	
	public static LectureDAO getInstance(){
		if(lectureDAO == null){ lectureDAO = new LectureDAO(); }
		return lectureDAO;
	}
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	
	
	//강의등록
	public int insertLecture(LectureBean lecture) {
		String sql = "INSERT INTO lecture VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		int insertCount = 0;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, lecture.getLecture_no());
			pstmt.setString(2, lecture.getLecture_name());
			pstmt.setString(3, lecture.getLecture_pro());
			pstmt.setInt(4, lecture.getLecture_grade());
			pstmt.setString(5, lecture.getLecture_dep());
			pstmt.setString(6, lecture.getLecture_category());
			pstmt.setInt(7, lecture.getLecture_score());
			pstmt.setInt(8, lecture.getLecture_nop());
			pstmt.setString(9, lecture.getLecture_time());
			pstmt.setString(10, lecture.getLecture_semester());
			pstmt.setString(11, lecture.getLecture_cp());
			pstmt.setString(12, lecture.getLecture_lp());
			
			insertCount = pstmt.executeUpdate();
		} catch (Exception e) { System.out.println("insertLecture 에러: " + e); }
		finally { close(pstmt); }
		
		return insertCount;
	}
	
	
	//강의조회 - user쪽에서 해당 메소드 사용하므로 아직 지우지 말것
	public ArrayList<LectureBean> selectLectureList(){
		String sql = "SELECT * FROM lecture";
		ArrayList<LectureBean> lectureList = null;
		LectureBean lb = null;
		try {
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				lectureList = new ArrayList<LectureBean>();
				do {
					lb = new LectureBean();
					lb.setLecture_no(rs.getInt("LECTURE_NO"));
					lb.setLecture_name(rs.getString("LECTURE_NAME"));
					lb.setLecture_pro(rs.getString("LECTURE_PRO"));
					lb.setLecture_grade(rs.getInt("LECTURE_GRADE"));
					lb.setLecture_dep(rs.getString("LECTURE_DEP"));
					lb.setLecture_category(rs.getString("LECTURE_CATEGORY"));
					lb.setLecture_score(rs.getInt("LECTURE_SCORE"));
					lb.setLecture_nop(rs.getInt("LECTURE_NOP"));
					lb.setLecture_time(rs.getString("LECTURE_TIME"));
					lb.setLecture_semester(rs.getString("LECTURE_SEMESTER"));
					lb.setLecture_cp(rs.getString("LECTURE_CP"));
					lb.setLecture_lp(rs.getString("LECTURE_LP"));
					
					lectureList.add(lb);
				}while (rs.next());
			}
		}catch (Exception ex) {
			System.out.println("getListMember 에러: " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}
	return lectureList;
}
	
	//강의조회 페이징버전...
		public ArrayList<LectureBean> selectLectureList(int page,int limit){

			String lecture_list_sql="select * from (select rownum rnum, A.* from (select * from lecture order by lecture_no ) A ) where rnum between ? and ?";
			ArrayList<LectureBean> lectureList = new ArrayList<LectureBean>();
			int startrow=(page-1)*10+1; //읽기 시작할 row 번호..	
			int endrow=(page-1)*10+10;

			try{
				pstmt = con.prepareStatement(lecture_list_sql);
				pstmt.setInt(1, startrow);
				pstmt.setInt(2, endrow);
				rs = pstmt.executeQuery();
				while(rs.next()){
					LectureBean lb = new LectureBean();
					lb.setLecture_no(rs.getInt("LECTURE_NO"));
					lb.setLecture_name(rs.getString("LECTURE_NAME"));
					lb.setLecture_pro(rs.getString("LECTURE_PRO"));
					lb.setLecture_grade(rs.getInt("LECTURE_GRADE"));
					lb.setLecture_dep(rs.getString("LECTURE_DEP"));
					lb.setLecture_category(rs.getString("LECTURE_CATEGORY"));
					lb.setLecture_score(rs.getInt("LECTURE_SCORE"));
					lb.setLecture_nop(rs.getInt("LECTURE_NOP"));
					lb.setLecture_time(rs.getString("LECTURE_TIME"));
					lb.setLecture_semester(rs.getString("LECTURE_SEMESTER"));
					lb.setLecture_cp(rs.getString("LECTURE_CP"));
					lb.setLecture_lp(rs.getString("LECTURE_LP"));
					lectureList.add(lb);
				}

			}catch(Exception ex){
				System.out.println("getLectureList 에러 : " + ex);
			}finally{
				close(rs);
				close(pstmt);
			}
			return lectureList;
		}	
	
	
	//강의정보 상세보기
	public LectureBean selectLecture(int no) {
		String sql = "SELECT * FROM lecture WHERE lecture_no=?";
		LectureBean lb = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				lb = new LectureBean();
				lb.setLecture_no(rs.getInt("LECTURE_NO"));
				lb.setLecture_name(rs.getString("LECTURE_NAME"));
				lb.setLecture_pro(rs.getString("LECTURE_PRO"));
				lb.setLecture_grade(rs.getInt("LECTURE_GRADE"));
				lb.setLecture_dep(rs.getString("LECTURE_DEP"));
				lb.setLecture_category(rs.getString("LECTURE_CATEGORY"));
				lb.setLecture_score(rs.getInt("LECTURE_SCORE"));
				lb.setLecture_nop(rs.getInt("LECTURE_NOP"));
				lb.setLecture_time(rs.getString("LECTURE_TIME"));
				lb.setLecture_semester(rs.getString("LECTURE_SEMESTER"));
				lb.setLecture_cp(rs.getString("LECTURE_CP"));
				lb.setLecture_lp(rs.getString("LECTURE_LP"));
			}
		} catch (Exception ex) {
			System.out.println("getDetailMember 에러: " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}
		return lb;
	}
	
	
	//강의 수정
		public int updateLecture(LectureBean lecture){

			int updateCount = 0;
			PreparedStatement pstmt = null;
			String sql="update lecture set LECTURE_NO=?,LECTURE_NAME=?,LECTURE_PRO=?,LECTURE_GRADE=?,LECTURE_DEP=?"
					+ ",LECTURE_CATEGORY=?,LECTURE_SCORE=?,LECTURE_NOP=?,LECTURE_TIME=?"
					+ ",LECTURE_SEMESTER=?,LECTURE_CP=?,LECTURE_LP=? where LECTURE_NO=?";

			try{
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, lecture.getLecture_no());
				pstmt.setString(2, lecture.getLecture_name());
				pstmt.setString(3, lecture.getLecture_pro());
				pstmt.setInt(4, lecture.getLecture_grade());
				pstmt.setString(5, lecture.getLecture_dep());
				pstmt.setString(6, lecture.getLecture_category());
				pstmt.setInt(7, lecture.getLecture_score());
				pstmt.setInt(8, lecture.getLecture_nop());
				pstmt.setString(9, lecture.getLecture_time());
				pstmt.setString(10, lecture.getLecture_semester());
				pstmt.setString(11, lecture.getLecture_cp());
				pstmt.setString(12, lecture.getLecture_lp());
				pstmt.setInt(13, lecture.getLecture_no());
				updateCount = pstmt.executeUpdate();
			}catch(Exception ex){
				System.out.println("lectureModify 에러 : " + ex);
			}finally{
				close(pstmt);
			}

			return updateCount;

		}
	
	//강의 삭제
	public int deleteLecture(int no) {
        String beforeSql = "select * from score where LECTURE_NO = ?";
        int deleteCount = 0;
        
        try {
        	pstmt = con.prepareStatement(beforeSql);
        	pstmt.setInt(1, no);
        	rs = pstmt.executeQuery();
        	if(rs.next()) {
        		deleteCount = -1;
        		return deleteCount;
        	} else {
        		String sql = "DELETE LECTURE WHERE LECTURE_NO=?";
				
				try {
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, no);
					deleteCount = pstmt.executeUpdate();
				} catch (Exception ex) { System.out.println("deleteMember 에러: " + ex); }
				finally { close(rs); close(pstmt); }
        	}
        	
        } catch (Exception ex) { System.out.println("selectCount 에러: " + ex); }
		
		return deleteCount;
	}
	
	
	//검색기능
	public ArrayList<LectureBean> selectLectureSearchList(int option, String searchWord) {
	    
	    String sql = "";
	    if(option == 01) {
	        sql = "select * from lecture where lecture_name like ?";
	    }else if(option == 02) {
	        sql = "select * from lecture where lecture_no like ?";
	    }else if(option == 03) {
		        sql = "select * from lecture where lecture_pro like ?";
	    }else {}
	    
	    ArrayList<LectureBean> lectureSearchList = new ArrayList<LectureBean>();
	        LectureBean lb = null;
	        
	        try {
	            pstmt = con.prepareStatement(sql);
	            pstmt.setString(1, "%"+searchWord+"%");
	            rs = pstmt.executeQuery();
	            
	            
	            if (rs.next()) {
	                do {
	                    lb = new LectureBean();
	                    lb.setLecture_no(rs.getInt("LECTURE_NO"));
	    				lb.setLecture_name(rs.getString("LECTURE_NAME"));
	    				lb.setLecture_pro(rs.getString("LECTURE_PRO"));
	    				lb.setLecture_grade(rs.getInt("LECTURE_GRADE"));
	    				lb.setLecture_dep(rs.getString("LECTURE_DEP"));
	    				lb.setLecture_category(rs.getString("LECTURE_CATEGORY"));
	    				lb.setLecture_score(rs.getInt("LECTURE_SCORE"));
	    				lb.setLecture_nop(rs.getInt("LECTURE_NOP"));
	    				lb.setLecture_time(rs.getString("LECTURE_TIME"));
	    				lb.setLecture_semester(rs.getString("LECTURE_SEMESTER"));
	    				lb.setLecture_cp(rs.getString("LECTURE_CP"));
	    				lb.setLecture_lp(rs.getString("LECTURE_LP"));
	                    lectureSearchList.add(lb);
	                } while (rs.next());
	            }
	        } catch (Exception ex) {
	            System.out.println("PostSearchList 에러 : " + ex);
	        } finally {
	            close(rs);
	            close(pstmt);
	        }
	        return lectureSearchList;
	        }
	
	
	
	
	//강의수 구하기
	public int selectListCount() {

		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{
			pstmt=con.prepareStatement("select count(*) from lecture");
			rs = pstmt.executeQuery();

			if(rs.next()){
				listCount=rs.getInt(1);
			}
		}catch(Exception ex){
			System.out.println("getListCount 에러: " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}
		return listCount;
	
}
}