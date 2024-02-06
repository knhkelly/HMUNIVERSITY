package svc;

import static util.JdbcUtil.close;
import static util.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.StudentDAO;
import vo.StudentBean;

public class PagingService {
	
	// 학생 전체 페이지
			public int getListCount() throws Exception{
				int listCount = 0;
				Connection con = getConnection();
				StudentDAO studentDAO = StudentDAO.getInstance();
				studentDAO.setConnection(con);
				listCount = studentDAO.selectListCount();
				
				close(con);
				return listCount;
			}
			
			// 학생 전체 목록
			public ArrayList<StudentBean> getSelectList(int page, int limit) throws Exception{
				
				ArrayList<StudentBean> studentList = null;
				Connection con = getConnection();
				StudentDAO studentDAO = StudentDAO.getInstance();
				studentDAO.setConnection(con);
				studentList = studentDAO.selectList(page,limit);
				
				close(con);
				
				return studentList;
			}
		

}
