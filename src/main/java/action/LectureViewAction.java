package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.LectureViewService;
import vo.ActionForward;
import vo.LectureBean;

public class LectureViewAction implements Action {
	
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = null;
		
			forward = new ActionForward();
			int no = Integer.parseInt(request.getParameter("lecture_no"));
			LectureViewService lectureViewService = new LectureViewService();
			LectureBean lecture = lectureViewService.getLecture(no);
			
			request.setAttribute("lecture", lecture);
			forward.setPath("./lecture/lecture_info.jsp");
		
		return forward;
	}
}






