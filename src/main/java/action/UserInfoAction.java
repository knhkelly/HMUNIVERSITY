package action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.UserImgSrcService;
import svc.UserInfoService;
import vo.ActionForward;
import vo.StudentBean;
import vo.StudentImgBean;

public class UserInfoAction implements Action{
	
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		ActionForward forward = null;
		
		int student_Id = Integer.parseInt(session.getAttribute("student_login").toString());
		UserInfoService userInfoService = new UserInfoService();
		StudentBean user = userInfoService.getStudentInfo(student_Id);
		request.setAttribute("user", user);
		
		UserImgSrcService imgService = new UserImgSrcService();
		StudentImgBean imgSrc = imgService.getPictureSrc(student_Id);
		request.setAttribute("imgSrc", imgSrc);
		
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./userInfo.jsp");
		return forward;
		
	}
}