package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.UserScoreService;
import vo.ActionForward;
import vo.ScoreBean;

public class UserScoreAction implements Action {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		int student_Id = Integer.parseInt(session.getAttribute("student_login").toString());
		
		UserScoreService userScoreService = new UserScoreService();
		ArrayList<ScoreBean> score = userScoreService.getScoreInfo(student_Id);
		
		request.setAttribute("score", score);
		forward.setPath("/user/userScoreInfo.jsp");
		return forward;
		
	}

}
