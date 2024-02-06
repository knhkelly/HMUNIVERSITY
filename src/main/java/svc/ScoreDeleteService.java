package svc;

import static util.JdbcUtil.*;

import java.sql.Connection;

import dao.ScoreDAO;
import vo.ScoreBean;

public class ScoreDeleteService {

	public boolean scoreDelete(ScoreBean score) {
		boolean deleteSuccess = false;
		ScoreDAO scoreDAO = ScoreDAO.getInstance();
		Connection con = getConnection();
		
		scoreDAO.setConnection(con);
		int insertCount = scoreDAO.scoreDelete(score);
		
		if(insertCount > 0){
			deleteSuccess = true;
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		
		return deleteSuccess;
	}
	
}
