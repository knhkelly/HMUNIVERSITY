package svc;

import static util.JdbcUtil.close;
import static util.JdbcUtil.commit;
import static util.JdbcUtil.getConnection;
import static util.JdbcUtil.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Iterator;

import dao.UserDAO;
import vo.ScoreBean;

public class UserLectureInsertService {
	
	public boolean getUserInsertLecture(ScoreBean scoreBean, int student_Id) {
		
		boolean isWriteSuccess = false;
		boolean valid = true;
		int insertCount = 0;
		
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		
		// 기존의 과목들 가져오기
		ArrayList<ScoreBean> score = userDAO.insertVaild(student_Id);
		Iterator<ScoreBean> iter = score.iterator();
		
		while(iter.hasNext()) {
			ScoreBean lecno = iter.next();
			int userLecno = lecno.getLecture_no();
			int inLecno = scoreBean.getLecture_no();
			
			System.out.println("userLecno : " + userLecno);
			System.out.println("inLecno : " + inLecno);
			
			if(userLecno == inLecno) {
				valid = false;
			}
		}
		if(valid) {
			insertCount = userDAO.insertSubject(scoreBean);
		}
		
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
