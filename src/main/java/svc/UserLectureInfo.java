package svc;

import static util.JdbcUtil.close;
import static util.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import dao.LectureDAO;
import vo.LectureBean;

public class UserLectureInfo {
	
	public ArrayList<LectureBean> getLectureInfo(HttpServletRequest request) {
		
		Connection con = getConnection();
		LectureDAO lecture = LectureDAO.getInstance();
		lecture.setConnection(con);
		
		ArrayList<LectureBean> userLecList = lecture.selectLectureList();
		request.setAttribute("userLecList", userLecList);
		close(con);
		
		return userLecList;
	}

}
