package svc;

import java.sql.Connection;

import dao.StudentDAO;
import vo.StudentBean;

import static util.JdbcUtil.close;
import static util.JdbcUtil.commit;
import static util.JdbcUtil.getConnection;
import static util.JdbcUtil.rollback;
import static util.JdbcUtil.*;
public class StudentInsertService {
	
	public boolean insertStudent(StudentBean newStudent) {
		boolean joinSuccess = false;
		StudentDAO studentDAO = StudentDAO.getInstance();
		Connection con = getConnection();
		
		studentDAO.setConnection(con);
		int insertCount = studentDAO.insertStudent(newStudent);
		
		if(insertCount > 0) {
			joinSuccess = true;
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return joinSuccess;
		}
	}



