package svc;

import static util.JdbcUtil.close;
import static util.JdbcUtil.getConnection;

import java.sql.Connection;
import dao.UserDAO;
import vo.StudentBean;

public class UserInfoService {
	
	public StudentBean getStudentInfo(int id) {
	
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		
		StudentBean user = userDAO.selectStudent(id);
		close(con);
		
		return user;
	}
}
