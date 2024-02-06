package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.LectureListService;
import vo.ActionForward;
import vo.LectureBean;

public class UserLectureAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		
		LectureListService lectureListService = new LectureListService();
		ArrayList<LectureBean> lectureList = lectureListService.getLectureList(); // dao에서 가져온거 리턴받아서 담음
		
		request.setAttribute("lectureList", lectureList);
		forward.setRedirect(false);
		forward.setPath("/user/userGetLecture.jsp");
		

		return forward;

	}

}
