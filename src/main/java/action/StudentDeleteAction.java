package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.StudentDeleteService;
import vo.ActionForward;
import vo.StudentBean;

public class StudentDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int deleteStudent = Integer.parseInt(request.getParameter("id"));
		
		ActionForward forward = null;
	
		StudentDeleteService studentDeleteService = new StudentDeleteService();
		boolean deleteResult = studentDeleteService.deleteStudent(deleteStudent);
	
			if(deleteResult) {
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("./layout.jsp?code=272");
			}else {
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				
				out.println("<script>");
				out.println("alert('회원정보삭제 실패');");
				out.println("location.href='./LoginAction.me';");
				out.println("</script>");
			}
		
			return forward;
	}
}
