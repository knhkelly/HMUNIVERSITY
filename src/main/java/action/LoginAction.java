package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.LoginService;
import vo.ActionForward;
import vo.StudentBean;

public class LoginAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		StudentBean student = new StudentBean();
		ActionForward forward = null;
		
		String loginId = request.getParameter("Student_Id");
		String loginPwd = request.getParameter("Student_Pw");
		
		if(loginId.equals("admin") && loginPwd.equals("1111")) {
			session.setAttribute("adminId", loginId);
			session.setAttribute("student_login", 2023000000);
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./main.jsp");
		} else {
			try {
				student.setStudent_Id(Integer.parseInt(loginId));
				student.setStudent_Pw(loginPwd);
			} catch (Exception e) {
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				
				out.println("<script>");
				out.println("alert('아이디 또는 비밀번호가 맞지 않습니다');");
				out.println("location.href='main.jsp';");
				out.println("</script>");
			}
			
			LoginService loginService = new LoginService();
			boolean loginResult = loginService.login(student);
			
			if(loginResult) {
				session.setAttribute("student_login", student.getStudent_Id());
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("./main.jsp");
			}else {
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				
				out.println("<script>");
				out.println("alert('아이디 또는 비밀번호가 맞지 않습니다');");
				out.println("location.href='main.jsp';");
				out.println("</script>");
			}
		}
		
		return forward;
	}

}
