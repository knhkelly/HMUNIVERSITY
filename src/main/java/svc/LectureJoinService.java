package svc;

import vo.LectureBean;
import static util.JdbcUtil.*;
import java.sql.Connection;
import dao.LectureDAO;

public class LectureJoinService {
	
	public boolean joinMember(LectureBean lecture) {
		boolean joinSuccess = false;
		LectureDAO lectureDAO = LectureDAO.getInstance();
		Connection con = getConnection();
		
		lectureDAO.setConnection(con);
		int insertCount = lectureDAO.insertLecture(lecture);
		
		if(insertCount > 0) {
			joinSuccess = true;
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		
		return joinSuccess;
	}

}
