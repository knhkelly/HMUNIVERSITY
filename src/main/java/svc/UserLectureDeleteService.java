package svc;

import static util.JdbcUtil.close;
import static util.JdbcUtil.commit;
import static util.JdbcUtil.getConnection;
import static util.JdbcUtil.rollback;

import java.sql.Connection;

import dao.UserDAO;

public class UserLectureDeleteService {
	
	public boolean getUserDeleteLecture(int student_Id, int lecture_no) {
		boolean isWriteSuccess = false;
		
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		
		userDAO.setConnection(con);
		int deleteCount = userDAO.deleteSubject(student_Id, lecture_no);
		
		if(deleteCount > 0){
			commit(con);
			isWriteSuccess = true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		
		return isWriteSuccess;
	}
}
