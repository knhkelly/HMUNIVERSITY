package svc;

import static util.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;
import dao.LectureDAO;
import vo.LectureBean;

public class LectureListService {
	public int getListCount() throws Exception{
		int listCount = 0;
		Connection con = getConnection();
		LectureDAO lectureDAO = LectureDAO.getInstance();
		lectureDAO.setConnection(con);
		
		listCount = lectureDAO.selectListCount();
		close(con);
		return listCount;
	}
	
	public ArrayList<LectureBean> getLectureList() {
		Connection con = getConnection();
		LectureDAO lectureDAO = LectureDAO.getInstance();
		lectureDAO.setConnection(con);
		
		ArrayList<LectureBean> lectureList = lectureDAO.selectLectureList();
		close(con);
		
		return lectureList;
	}
	
	public ArrayList<LectureBean> getLectureList(int page, int limit) {
		Connection con = getConnection();
		LectureDAO lectureDAO = LectureDAO.getInstance();
		lectureDAO.setConnection(con);
		
		ArrayList<LectureBean> lectureList = lectureDAO.selectLectureList(page,limit);
		close(con);
		
		return lectureList;
	}

    public ArrayList<LectureBean> getSearchList(int option, String searchWord) {
        Connection con = getConnection();
        LectureDAO lectureDAO = LectureDAO.getInstance();
        lectureDAO.setConnection(con);
        
        ArrayList<LectureBean> lectureList = lectureDAO.selectLectureSearchList(option, searchWord);
            
        close(con);
        return lectureList;
	}
}

	
	

