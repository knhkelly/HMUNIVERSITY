package svc;

import static util.JdbcUtil.close;
import static util.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.ScoreDAO;
import vo.ScoreBean;

public class ScoreViewService {
	public ScoreBean getLectureScore(int student_Id, int lecture_no) {
		Connection con = getConnection();
		ScoreDAO scoreDAO = ScoreDAO.getInstance();
		scoreDAO.setConnection(con);
		
		ScoreBean scoreBean = scoreDAO.scoreView(student_Id, lecture_no);
		close(con);
		
		return scoreBean;
		
	}
}
