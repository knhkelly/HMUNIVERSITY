package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.UserLectureInfoService;
import vo.ActionForward;
import vo.LectureBean;

public class UserLectureInfoAction implements Action {
	
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		ActionForward forward = null;
		forward = new ActionForward();
		
		int id = Integer.parseInt(session.getAttribute("student_login").toString());
		UserLectureInfoService userLectureInfoService = new UserLectureInfoService();
		ArrayList<LectureBean> userLec = userLectureInfoService.getUserLectureInfo(id);
		
		request.setAttribute("userLec", userLec);
		forward.setRedirect(false);
		forward.setPath("/user/userLectureInfo.jsp");
		
		return forward;
		
	}
}
