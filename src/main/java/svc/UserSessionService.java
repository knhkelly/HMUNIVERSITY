package svc;

import static util.JdbcUtil.getConnection;
import static util.JdbcUtil.close;

import java.sql.Connection;

import dao.UserDAO;
import vo.StudentBean;

public class UserSessionService {
	
	public StudentBean getUserInfo(int student_Id) {
		Connection con = getConnection();
		UserDAO student = UserDAO.getInstance();
		
		StudentBean user = student.selectStudent(student_Id);
		close(con);

		return user;
	}
}
