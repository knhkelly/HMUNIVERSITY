package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.ScoreViewService;
import vo.ActionForward;
import vo.ScoreBean;

public class ScoreViewAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		
		int student_Id = Integer.parseInt(session.getAttribute("student_no").toString());
		int lecture_no = Integer.parseInt(request.getParameter("id"));
        ActionForward forward = null;
        
        forward = new ActionForward();
        ScoreViewService scoreViewService = new ScoreViewService();
        ScoreBean scoreBean = scoreViewService.getLectureScore(student_Id, lecture_no);
        
        session.setAttribute("lectureScore", scoreBean);
        forward.setPath("./lecturescore.jsp");
        
		return forward;
	}
}
