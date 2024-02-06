package svc;

import static util.JdbcUtil.*;

import java.sql.Connection;

import dao.ScoreDAO;
import vo.ScoreBean;

public class ScoreWriteService {

	public boolean scoreWrite(ScoreBean score) {
		boolean writeSuccess = false;
		ScoreDAO scoreDAO = ScoreDAO.getInstance();
		Connection con = getConnection();
		
		scoreDAO.setConnection(con);
		int insertCount = scoreDAO.scoreWrite(score);
		
		if(insertCount > 0){
			writeSuccess = true;
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		
		return writeSuccess;
	}
	
}
