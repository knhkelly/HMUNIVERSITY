package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.LectureViewService;
import vo.ActionForward;
import vo.LectureBean;

public class LectureModifyAction implements Action {
	
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
		 ActionForward forward = new ActionForward();
			int lecture_no = Integer.parseInt(request.getParameter("lecture_no"));
			LectureViewService lectureViewService = new LectureViewService();	
		   	LectureBean lecture = lectureViewService.getLecture(lecture_no);
		   	request.setAttribute("lecture", lecture);
	   		forward.setPath("lecture/lecture_modify.jsp");
//	   		forward.setPath("./layout.jsp?code=283&lecno="+lecture_no);
	   		return forward;
		 
		}
	 }
