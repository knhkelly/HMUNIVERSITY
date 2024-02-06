package svc;

import static util.JdbcUtil.close;
import static util.JdbcUtil.commit;
import static util.JdbcUtil.getConnection;
import static util.JdbcUtil.rollback;

import java.sql.Connection;

import dao.ScoreDAO;
import vo.ScoreBean;

public class ScoreRewriteService {

	public boolean scoreRewrite(ScoreBean score) {
		boolean rewriteSuccess = false;
		ScoreDAO scoreDAO = ScoreDAO.getInstance();
		Connection con = getConnection();
		
		scoreDAO.setConnection(con);
		int insertCount = scoreDAO.scoreRewrite(score);
		
		if(insertCount > 0){
			rewriteSuccess = true;
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		
		return rewriteSuccess;
	}
}
