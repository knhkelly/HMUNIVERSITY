package svc;

import static util.JdbcUtil.close;
import static util.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.BoardDAO;
import vo.BoardBean;

public class UserBoardService {
	
	public ArrayList<BoardBean> getBoardList(){
		
		Connection con = getConnection();
		BoardDAO board = BoardDAO.getInstance();
		board.setConnection(con);
		
		ArrayList<BoardBean> boardArr = board.descAllSelect();
		close(con);
		
		return boardArr;
	}

}
