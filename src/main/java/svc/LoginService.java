package svc;

import static util.JdbcUtil.close;
import static util.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.StudentDAO;
import vo.StudentBean;

public class LoginService {
	public boolean login(StudentBean member) {

		Connection con = getConnection();
		StudentDAO studentDAO = StudentDAO.getInstance();
		studentDAO.setConnection(con);
		
		boolean loginResult = false;
		String loginId = studentDAO.selectLoginId(member);
		
		if(loginId != null) {
			loginResult = true;
		}
		close(con);
		return loginResult;
	}

}
