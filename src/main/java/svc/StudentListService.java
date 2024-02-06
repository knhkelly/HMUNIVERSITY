package svc;

import static util.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;

import dao.ScoreDAO;
import dao.StudentDAO;
import vo.StudentBean;

public class StudentListService {
	public int getListCount() throws Exception{
		int listCount = 0;
		Connection con = getConnection();
		StudentDAO studentDAO = StudentDAO.getInstance();
		studentDAO.setConnection(con);
		
		listCount = studentDAO.selectListCount();
		close(con);
		return listCount;
	}
	
	public ArrayList<StudentBean> getStudentList() {
		Connection con = getConnection();
		StudentDAO studentDAO = StudentDAO.getInstance();
		studentDAO.setConnection(con);
		
		ArrayList<StudentBean> studentList = studentDAO.selectStudentList();
		close(con);
		
		return studentList;
	}
	
	public ArrayList<StudentBean> getStudentList(int page, int limit) {
		Connection con = getConnection();
		StudentDAO studentDAO = StudentDAO.getInstance();
		studentDAO.setConnection(con);
		
		ArrayList<StudentBean> studentList = studentDAO.selectStudentList(page,limit);
		close(con);
		
		return studentList;
	}

    public ArrayList<StudentBean> getSearchList(int option, String searchWord) {
        Connection con = getConnection();
        ScoreDAO scoreDAO = ScoreDAO.getInstance();
        scoreDAO.setConnection(con);
        
        ArrayList<StudentBean> studentList = scoreDAO.studentSearch(option, searchWord);
            
        close(con);
        return studentList;
	}
}

	
	

