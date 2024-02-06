package action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.UserImgSrcService;
import svc.UserUpdateService;
import vo.ActionForward;
import vo.StudentBean;
import vo.StudentImgBean;

public class UserUpdateAction implements Action {
	
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		
		int student_Id = Integer.parseInt(session.getAttribute("student_login").toString());
		
		UserUpdateService userUpdateService = new UserUpdateService();
		StudentBean student = userUpdateService.getUserUpdate(student_Id);
		request.setAttribute("student", student);
		

		
		forward.setPath("/user/userInfoUpdate.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
}	
