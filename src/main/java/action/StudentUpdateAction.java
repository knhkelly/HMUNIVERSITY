package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.StudentUpdateService;
import vo.ActionForward;
import vo.StudentBean;

public class StudentUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		StudentBean student = new StudentBean();
		boolean updateResult = false;

		student.setStudent_Id(Integer.parseInt(request.getParameter("student_Id")));
		student.setStudent_Pw(request.getParameter("student_Pw"));
		student.setStudent_Name(request.getParameter("student_Name"));
		student.setStudent_Dep(request.getParameter("student_Dep"));
		student.setStudent_Reg(request.getParameter("student_Reg"));
		student.setStudent_Mail(request.getParameter("student_Mail"));
		student.setStudent_Statu(request.getParameter("student_Statu"));
		student.setStudent_Address(request.getParameter("student_Address"));
		student.setStudent_Phone(request.getParameter("student_Phone"));
		student.setStudent_Gender(request.getParameter("student_Gender"));

		StudentUpdateService StudentUpdateService = new StudentUpdateService();
		updateResult = StudentUpdateService.updateStudent(student);
		
		ActionForward forward = null;
		if(updateResult) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./layout.jsp?code=272");
		}

		return forward;
	}

}
