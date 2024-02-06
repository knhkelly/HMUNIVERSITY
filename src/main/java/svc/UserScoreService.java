package svc;

import static util.JdbcUtil.getConnection;
import static util.JdbcUtil.close;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ScoreDAO;
import vo.ScoreBean;

public class UserScoreService {
	
public ArrayList<ScoreBean> getScoreInfo(int student_Id){
		
		Connection con = getConnection();
		ScoreDAO score = ScoreDAO.getInstance();
		score.setConnection(con);
		
		ArrayList<ScoreBean> scoreArr = score.selectUserScore(student_Id);
		close(con);
		
		return scoreArr;
	}

}
