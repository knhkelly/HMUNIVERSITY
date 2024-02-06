package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.UserInfoService;
import svc.UserLectureInsertService;
import vo.ActionForward;
import vo.ScoreBean;
import vo.StudentBean;

public class UserLectureInsertAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		ScoreBean score = new ScoreBean();
		boolean userResult = false;
		int student_Id = Integer.parseInt(session.getAttribute("student_login").toString());
		
		UserInfoService uis = new UserInfoService();
		StudentBean student = uis.getStudentInfo(student_Id);
		
		String dep = student.getStudent_Dep();
		String name = student.getStudent_Name();
		
		score.setStudent_name(name);
		score.setStudent_no(student_Id);
		score.setStudent_dep(dep);
		score.setLecture_name(request.getParameter("lnm"));
		score.setLecture_no(Integer.parseInt(request.getParameter("no")));

		UserLectureInsertService userLectureInsertService = new UserLectureInsertService();
		userResult = userLectureInsertService.getUserInsertLecture(score,student_Id);
		
		ActionForward forward = null;
		
		if (userResult == false) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('이미 수강신청된 과목입니다.');");
			out.println("history.back();");
			out.println("</script>");
		}
		else {
			forward = new ActionForward();
			forward.setPath("userLayout.jsp?code=55");
			forward.setRedirect(true);
		}
		
		return forward;
	}
}
