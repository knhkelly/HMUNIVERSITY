package svc;

import static util.JdbcUtil.close;
import static util.JdbcUtil.commit;
import static util.JdbcUtil.getConnection;
import static util.JdbcUtil.rollback;

import java.sql.Connection;

import dao.UserDAO;
import vo.StudentBean;

public class UserInfoUpdateService {
	
	public boolean getInfoUpdate(StudentBean student) {
		
		boolean isUpdateSuccess = false;
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		
		userDAO.setConnection(con);
		
		int updateCount = userDAO.updateUser(student);
		
		if(updateCount > 0){
			commit(con);
			isUpdateSuccess = true;
		}
		else{
			rollback(con);
		}
		close(con);
		return isUpdateSuccess;
	}
}
