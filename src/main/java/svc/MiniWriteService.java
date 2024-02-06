package svc;

import static util.JdbcUtil.close;
import static util.JdbcUtil.commit;
import static util.JdbcUtil.getConnection;
import static util.JdbcUtil.rollback;

import java.sql.Connection;

import dao.BoardDAO;
import dao.MiniBoardDAO;
import vo.BoardBean;
import vo.MiniBoardBean;

public class MiniWriteService{

	public boolean miniInsert(MiniBoardBean miniBoardBean) throws Exception{
	boolean isWriteSuccess = false;
	Connection con = getConnection();
	MiniBoardDAO miniBoardDAO = MiniBoardDAO.getInstance();
	miniBoardDAO.setConnection(con);
	int insertCount = miniBoardDAO.insert(miniBoardBean);
	
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
