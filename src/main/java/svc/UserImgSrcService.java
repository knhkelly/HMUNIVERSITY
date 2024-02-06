package svc;

import static util.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.UserDAO;
import vo.StudentImgBean;

public class UserImgSrcService {
	
	public StudentImgBean getPictureSrc(int student_Id) {
		Connection con = getConnection();
		UserDAO user = UserDAO.getInstance();
		user.setConnection(con);
		
		StudentImgBean imgSrc = user.pictureSrc(student_Id);
		System.out.println(imgSrc.getImgSrc());
		return imgSrc;
	}

}
