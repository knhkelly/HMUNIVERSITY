package svc;

import static util.JdbcUtil.*;
import java.sql.Connection;
import dao.LectureDAO;

public class LectureDeleteService {
	
	public int deleteLecture(int deleteNo) {
		int deleteResult = 0;
		Connection con = getConnection();
		LectureDAO lectureDAO = LectureDAO.getInstance();
		
		lectureDAO.setConnection(con);
		int deleteCount = lectureDAO.deleteLecture(deleteNo);
		
		if (deleteCount > 0) {
			commit(con);
			deleteResult = 1;
		} else if (deleteCount == 0){
			deleteResult = 0;
			rollback(con);
		} else if (deleteCount < 0) {
			deleteResult = -1;
		}
		close(con);
		return deleteResult;
	}

}

