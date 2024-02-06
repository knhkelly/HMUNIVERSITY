package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.StudentViewService;
import vo.ActionForward;
import vo.StudentBean;

public class StudentViewAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("student_Id");
		ActionForward forward = null;
		
		forward = new ActionForward();
		
		StudentViewService studentViewService = new StudentViewService();
		StudentBean student = studentViewService.getStudent(id);
			
		request.setAttribute("student", student);
		forward.setPath("./Student/student_info.jsp");
		
		return forward;
	}
}
