package svc;

import java.sql.Connection;
import static util.JdbcUtil.*;
import dao.LectureDAO;
import vo.LectureBean;

public class LectureViewService {
	
	public LectureBean getLecture (int viewId) {
		Connection con = getConnection();
		LectureDAO lectureDAO = LectureDAO.getInstance();
		
		lectureDAO.setConnection(con);
		LectureBean lecture = lectureDAO.selectLecture(viewId);
		close(con);
		
		return lecture;
	}
}



