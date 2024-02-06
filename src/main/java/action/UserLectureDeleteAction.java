package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.UserLectureDeleteService;
import vo.ActionForward;

public class UserLectureDeleteAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		ActionForward forward = null;
		boolean userResult = false;
		int lecture_no = Integer.parseInt(request.getParameter("lecture_no"));
		int student_Id = Integer.parseInt(session.getAttribute("student_login").toString());
		
		UserLectureDeleteService userLectureDeleteService = new UserLectureDeleteService();
		userResult = userLectureDeleteService.getUserDeleteLecture(student_Id,lecture_no);
		
		if (userResult == false) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('수강취소에 실패하셨습니다.');");
			out.println("history.back();");
			out.println("</script>");
		}
		else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("userLayout.jsp?code=30");
		}
		
		return forward;
	}
	
}
