package svc;

import static util.JdbcUtil.*;
import java.sql.Connection;
import vo.LectureBean;
import dao.LectureDAO;

public class LectureModifyService {
public  boolean modifyLecture(LectureBean lecture) throws Exception{
		
		
		boolean isModifySuccess = false;
		Connection con = getConnection();
		LectureDAO lectureDAO = LectureDAO.getInstance();

		lectureDAO.setConnection(con);
		
		int insertCount = lectureDAO.updateLecture(lecture);
		
		if(insertCount > 0){
			commit(con);
			isModifySuccess = true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isModifySuccess;
		
	}

}