package svc;

import static util.JdbcUtil.close;
import static util.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.UserDAO;
import vo.LectureBean;

public class UserLectureInfoService {

	public ArrayList<LectureBean> getUserLectureInfo(int student_Id) {
		
		Connection con = getConnection();
		UserDAO user = UserDAO.getInstance();
		user.setConnection(con);
		ArrayList<LectureBean> userLec = user.userSubject(student_Id);
		close(con);
		
		return userLec;
	}
	
}
