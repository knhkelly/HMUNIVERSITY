package svc;

import java.sql.Connection;
import dao.LectureDAO;
import vo.LectureBean;
import static util.JdbcUtil.*;
public class LectureRegProService {

	public boolean registLecture(LectureBean lecture) throws Exception{
		
		
		boolean isWriteSuccess = false;
		Connection con = getConnection();
		LectureDAO lectureDAO = LectureDAO.getInstance();

		lectureDAO.setConnection(con);
		
		int insertCount = lectureDAO.insertLecture(lecture);
		
		if(insertCount > 0){
			commit(con);
			isWriteSuccess = true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isWriteSuccess;
		
	}

}