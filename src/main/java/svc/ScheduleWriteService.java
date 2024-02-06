package svc;

import static util.JdbcUtil.close;
import static util.JdbcUtil.commit;
import static util.JdbcUtil.getConnection;
import static util.JdbcUtil.rollback;

import java.sql.Connection;
import dao.ScheduleDAO;
import vo.ScheduleBean;

public class ScheduleWriteService{

	public boolean scheduleInsertService(ScheduleBean scheduleBean) throws Exception{
	boolean isWriteSuccess = false;
	Connection con = getConnection();
	ScheduleDAO scheduleDAO = ScheduleDAO.getInstance();
	scheduleDAO.setConnection(con);
	int insertCount = scheduleDAO.scheduleInsertDao(scheduleBean);
	
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
