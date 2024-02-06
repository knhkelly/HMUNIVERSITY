package svc;

import java.sql.Connection;
import java.util.ArrayList;
import static util.JdbcUtil.*;
import dao.BoardDAO;
import vo.BoardBean;

public class UserMiniBoardService {
	
	public ArrayList<BoardBean> getBoardList(){
		
		Connection con = getConnection();
		BoardDAO board = BoardDAO.getInstance();
		board.setConnection(con);
		
		ArrayList<BoardBean> boardArr = board.descSelect();
		close(con);
		
		return boardArr;
	}

}
