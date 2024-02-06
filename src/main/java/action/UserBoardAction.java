package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.UserBoardService;
import vo.ActionForward;
import vo.BoardBean;

public class UserBoardAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		ActionForward forward = null;
		UserBoardService userBoardService = new UserBoardService();
		ArrayList<BoardBean> allBoard = userBoardService.getBoardList();
		request.setAttribute("allBoard", allBoard);
		
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./userBoard.jsp");
		return forward;
	}
}
