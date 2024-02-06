package svc;

import static util.JdbcUtil.close;
import static util.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.UserDAO;
import vo.LectureBean;

public class UserLayoutLectureService {

	public ArrayList<LectureBean> getLayoutLecture(int Student_Id){
		
		Connection con = getConnection();
		
		ArrayList<LectureBean> layoutLecture = null;
		UserDAO user = UserDAO.getInstance();
		user.setConnection(con);
		layoutLecture = user.layoutLectures(Student_Id);
		
		close(con);
		
		return layoutLecture;
		
	}
}
