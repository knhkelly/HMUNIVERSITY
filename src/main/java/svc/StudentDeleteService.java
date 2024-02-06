package svc;

import static util.JdbcUtil.*;
import java.sql.Connection;

import dao.StudentDAO;
import vo.StudentBean;

public class StudentDeleteService {
	
	public boolean deleteStudent(int deleteStudent) {
		
		boolean deleteResult = false;
		StudentDAO studentDAO = StudentDAO.getInstance();
		Connection con = getConnection();
		
		studentDAO.setConnection(con);
		int deleteCount = studentDAO.deleteStudent(deleteStudent);
		
		if(deleteCount > 0) {
			deleteResult = true;
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return deleteResult;
	}

}
