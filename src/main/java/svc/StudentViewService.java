package svc;

import static util.JdbcUtil.close;
import static util.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.StudentDAO;
import vo.StudentBean;

public class StudentViewService {
	public StudentBean getStudent(String id) {
		Connection con = getConnection();
		StudentDAO studentDAO = StudentDAO.getInstance();
		
		studentDAO.setConnection(con);
		StudentBean student = studentDAO.selectStudent(id);
		close(con);
		
		return student;
	}

}
