package svc;

import static util.JdbcUtil.close;
import static util.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.UserDAO;
import vo.StudentBean;

public class UserUpdateService {

	public StudentBean getUserUpdate(int student_Id){
		Connection con = getConnection();
		UserDAO pd = UserDAO.getInstance();
		pd.setConnection(con);
		StudentBean student = pd.selectStudent(student_Id); 
		close(con);
		
		
		return student;
	}
	
}
