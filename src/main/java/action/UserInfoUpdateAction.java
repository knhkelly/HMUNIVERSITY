package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.UserInfoUpdateService;
import vo.ActionForward;
import vo.StudentBean;

public class UserInfoUpdateAction implements Action {
	
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		System.out.println("액션 들어옴");
		HttpSession session = request.getSession();
		ActionForward forward = null;
		boolean isUpdateSuccess = false;
		StudentBean student = new StudentBean();
		UserInfoUpdateService userInfoUpdateService = new UserInfoUpdateService();
		System.out.println("서비스 객체 생성");
		int student_Id = Integer.parseInt(session.getAttribute("student_login").toString());
		
		
		student.setStudent_Id(student_Id);
		student.setStudent_Pw(request.getParameter("STUDENT_PW"));
		student.setStudent_Mail(request.getParameter("STUDENT_MAIL"));
		student.setStudent_Address(request.getParameter("STUDENT_ADDRESS"));
		student.setStudent_Phone(request.getParameter("STUDENT_PHONE"));
		
		isUpdateSuccess = userInfoUpdateService.getInfoUpdate(student);
		
		
		System.out.println("if문 직전");
		if(!isUpdateSuccess){
			PrintWriter out=response.getWriter();
			response.setContentType("text/html;charset=UTF-8");
			out.println("<script>");
			out.println("alert('수정에 실패하였습니다.');");
			out.println("history.back()");
			out.println("</script>");
		}
		else{
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("userLayout.user?code=41");
		}

		
		
		return forward;
	}

}
