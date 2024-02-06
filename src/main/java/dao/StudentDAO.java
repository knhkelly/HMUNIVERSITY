package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import static util.JdbcUtil.*;

import vo.StudentBean;

public class StudentDAO {
	
		public static StudentDAO instance;
		Connection con;
		PreparedStatement pstmt;
		ResultSet rs;
		
		private StudentDAO() {}
		
		public static StudentDAO getInstance() {
			if(instance == null) {
				instance = new StudentDAO();
			}
			return instance;
		}
		
		public void setConnection(Connection con) {
			this.con = con;
		}
		
		// 로그인처리
		public String selectLoginId(StudentBean student) {
			String loginId = null;
			String sql = "SELECT STUDENT_ID FROM STUDENT WHERE STUDENT_ID=? AND STUDENT_PW=?";
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, student.getStudent_Id());
				pstmt.setString(2, student.getStudent_Pw());
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					loginId = rs.getString("STUDENT_ID");
				}
			}catch(Exception ex) {
				System.out.println("에러 : " + ex);
			}finally {
				close(rs);
				close(pstmt);
			}
			return loginId;
		}
		
		// 학생 등록
		public int insertStudent(StudentBean newStudent) {
			String sql = "INSERT INTO STUDENT VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			int insertCount = 0;
			System.out.println("insert문 입니다");
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, newStudent.getStudent_Id());
				pstmt.setString(2, newStudent.getStudent_Pw());
				pstmt.setString(3, newStudent.getStudent_Name());
				pstmt.setString(4, newStudent.getStudent_Dep());
				pstmt.setString(5, newStudent.getStudent_Reg());
				pstmt.setString(6, newStudent.getStudent_Gender());
				pstmt.setString(7, newStudent.getStudent_Mail());
				pstmt.setString(8, newStudent.getStudent_Statu());
				pstmt.setString(9, newStudent.getStudent_Address());
				pstmt.setString(10, newStudent.getStudent_Phone());
				insertCount = pstmt.executeUpdate();

			}catch(Exception ex) {
				System.out.println("처리된 행 수" + insertCount );
				System.out.println("joinStudent 에러 : " + ex);
			}finally {
				close(pstmt);
			}
			return insertCount;
		}
		
		// 전체 학생 목록
		public ArrayList<StudentBean> selectStudentList(){
			String sql = "SELECT * FROM STUDENT";
			ArrayList<StudentBean> studentList = null;
			StudentBean sb = null;
			try {
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					studentList = new ArrayList<StudentBean>();
					do {
						sb = new StudentBean();
						sb.setStudent_Id(rs.getInt("student_Id"));
						sb.setStudent_Pw(rs.getString("student_Pw"));
						sb.setStudent_Name(rs.getString("student_Name"));
						sb.setStudent_Dep(rs.getString("student_Dep"));
						sb.setStudent_Reg(rs.getString("student_Reg"));
						sb.setStudent_Gender(rs.getString("student_Gender"));
						sb.setStudent_Mail(rs.getString("student_Mail"));
						sb.setStudent_Statu(rs.getString("student_Statu"));
						sb.setStudent_Address(rs.getString("student_Address"));
						sb.setStudent_Phone(rs.getString("student_Phone"));
						studentList.add(sb);
					}while(rs.next());
				}
						
			}catch(Exception ex) {
				System.out.println("getListStudent 오류 : " + ex);
			}finally {
				close(rs);
				close(pstmt);
			}
			return studentList;
		}
		
		//학생목록 페이징버전....
		public ArrayList<StudentBean> selectStudentList(int page,int limit){
			System.out.println("page, limit : "+page + ", "+limit);
			String student_list_sql="select * from (select rownum rnum, A.* from (select * from student order by student_id ) A ) where rnum between ? and ?";
			ArrayList<StudentBean> studentList = new ArrayList<StudentBean>();
			int startrow=(page-1)*10+1; //읽기 시작할 row 번호..	11
			int endrow=(page-1)*10+10; //20

			try{
				pstmt = con.prepareStatement(student_list_sql);
				pstmt.setInt(1, startrow);
				pstmt.setInt(2, endrow);
				rs = pstmt.executeQuery();
				while(rs.next()){
					StudentBean sb = new StudentBean();
					sb.setStudent_Id(rs.getInt("student_Id"));
					sb.setStudent_Pw(rs.getString("student_Pw"));
					sb.setStudent_Name(rs.getString("student_Name"));
					sb.setStudent_Dep(rs.getString("student_Dep"));
					sb.setStudent_Reg(rs.getString("student_Reg"));
					sb.setStudent_Gender(rs.getString("student_Gender"));
					sb.setStudent_Mail(rs.getString("student_Mail"));
					sb.setStudent_Statu(rs.getString("student_Statu"));
					sb.setStudent_Address(rs.getString("student_Address"));
					sb.setStudent_Phone(rs.getString("student_Phone"));
					studentList.add(sb);
				}

			}catch(Exception ex){
				System.out.println("getStudentList 에러 : " + ex);
			}finally{
				close(rs);
				close(pstmt);
			}
			return studentList;
		}	
		
		// 학생 정보
		public StudentBean selectStudent(String id) {
			String sql = "SELECT * FROM STUDENT WHERE STUDENT_ID = ?";
			StudentBean sb = null;
			
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					sb = new StudentBean();
					sb.setStudent_Id(rs.getInt("student_Id"));
					sb.setStudent_Pw(rs.getString("student_Pw"));
					sb.setStudent_Name(rs.getString("student_Name"));
					sb.setStudent_Dep(rs.getString("student_Dep"));
					sb.setStudent_Reg(rs.getString("student_Reg"));
					sb.setStudent_Gender(rs.getString("student_Gender"));
					sb.setStudent_Mail(rs.getString("student_Mail"));
					sb.setStudent_Statu(rs.getString("student_Statu"));
					sb.setStudent_Address(rs.getString("student_Address"));
					sb.setStudent_Phone(rs.getString("student_Phone"));
				}
			}catch(Exception ex) {
				System.out.println("getDetailStudent 에러 : " + ex);
			}finally {
				close(rs);
				close(pstmt);
			}
			return sb;
		}
		
		// 학생 삭제
		public int deleteStudent(int deleteStudent) {
			String sql = "DELETE STUDENT WHERE STUDENT_ID=?";
			int deleteCount = 0;
			
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, deleteStudent);
				deleteCount = pstmt.executeUpdate();
			}catch(Exception ex) {
				System.out.println("deleteStudent 에러 : " + ex);
			}finally {
				close(pstmt);
			}
			return deleteCount;
		}
		
		// 학생정보 수정
		public int updateStudent(StudentBean student) {
			String sql = "UPDATE STUDENT SET STUDENT_PW = ?,STUDENT_NAME = ?, STUDENT_DEP = ?, STUDENT_REG =?, STUDENT_GENDER =?, STUDENT_MAIL =?, STUDENT_STATU =?, STUDENT_ADDRESS =?, STUDENT_PHONE =? WHERE STUDENT_ID=?";
			int updateCount = 0;
			
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, student.getStudent_Pw());
				pstmt.setString(2, student.getStudent_Name());
				pstmt.setString(3, student.getStudent_Dep());
				pstmt.setString(4, student.getStudent_Reg());
				pstmt.setString(5, student.getStudent_Gender());
				pstmt.setString(6, student.getStudent_Mail());
				pstmt.setString(7, student.getStudent_Statu());
				pstmt.setString(8, student.getStudent_Address());
				pstmt.setString(9, student.getStudent_Phone());
				pstmt.setInt(10, student.getStudent_Id());
				
				updateCount = pstmt.executeUpdate();
			}catch(Exception ex) {
				System.out.println("updateStudent 에러 : " + ex);
			}finally {
				close(pstmt);
			}
			return updateCount;
		}
		
		
		//페이지 개수
		
				public ArrayList<StudentBean> selectList(int page, int limit) {
				      System.out.println("dao 1");
				      
				      PreparedStatement pstmt = null;
				      ResultSet rs = null;
				      String sql = "select * from(select rownum rnum, A.* from(select*from STUDENT order by STUDENT_ID) A) where rnum between ? and ?";
				      ArrayList<StudentBean> studentList = new ArrayList<StudentBean>();
				      int startrow=(page-1)*10+1;
				      int endrow=(page-1)*10+10;
				      
				      try {
				         System.out.println("dao 2");
				         pstmt = con.prepareStatement(sql);
				         System.out.println("dao 2-1");
				         pstmt.setInt(1, startrow);
				         System.out.println("dao 2-2");
				         pstmt.setInt(2, endrow);
				         System.out.println("dao 2-3");
				         rs = pstmt.executeQuery();
				         System.out.println("dao 2-4");

				         System.out.println("dao 3");
				         while(rs.next()) {
				        	StudentBean sb = new StudentBean();
								sb.setStudent_Id(rs.getInt("student_Id"));
								sb.setStudent_Pw(rs.getString("student_Pw"));
								sb.setStudent_Name(rs.getString("student_Name"));
								sb.setStudent_Dep(rs.getString("student_Dep"));
								sb.setStudent_Reg(rs.getString("student_Reg"));
								sb.setStudent_Gender(rs.getString("student_Gender"));
								sb.setStudent_Mail(rs.getString("student_Mail"));
								sb.setStudent_Statu(rs.getString("student_Statu"));
								sb.setStudent_Address(rs.getString("student_Address"));
								sb.setStudent_Phone(rs.getString("student_Phone"));
								  System.out.println("dao 4");
				         }
				         
				      } catch(Exception e) {
				         System.out.println("getBookUList 에러 : " + e);
				      } finally {
				         close(rs);
				         close(pstmt);
				      }
				      System.out.println("dao 5");
				      return studentList;
				}
				
				
				//학생 총 인원
				   public int selectListCount() {
				      
				      int listCount= 0;
				      PreparedStatement pstmt = null;
				      ResultSet rs = null;
				      
				      try {
				         System.out.println("getConnection");
				         pstmt=con.prepareStatement("select count(*) from STUDENT");
				         rs = pstmt.executeQuery();
				         
				         if(rs.next()){
				            listCount = rs.getInt(1);
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


