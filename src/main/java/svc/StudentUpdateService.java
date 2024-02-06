package svc;

import static util.JdbcUtil.close;
import static util.JdbcUtil.commit;
import static util.JdbcUtil.getConnection;
import static util.JdbcUtil.rollback;

import java.sql.Connection;

import dao.StudentDAO;
import vo.StudentBean;

public class StudentUpdateService {
	
	public boolean updateStudent(StudentBean student) {
		boolean updateResult = false;
		Connection con = getConnection();
		StudentDAO studentDAO = StudentDAO.getInstance();
		
		studentDAO.setConnection(con);
		int updateCount = studentDAO.updateStudent(student);
		if(updateCount > 0) {
			commit(con);
			updateResult = true;
		}else {
			rollback(con);
		}
		close(con);
		return updateResult;
	}
}
