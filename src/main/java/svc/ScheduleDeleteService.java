package svc;

import static util.JdbcUtil.*;
import java.sql.Connection;
import dao.ScheduleDAO;

public class ScheduleDeleteService {
	
	public int deleteLecture(int num) {
		int deleteResult = 0;
		Connection con = getConnection();
		ScheduleDAO scheduleDAO = ScheduleDAO.getInstance();
		
		scheduleDAO.setConnection(con);
		int deleteCount = scheduleDAO.deleteSchedule(num);
		
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

