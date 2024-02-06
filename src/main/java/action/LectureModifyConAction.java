package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.LectureModifyService;
import vo.ActionForward;
import vo.LectureBean;

public class LectureModifyConAction implements Action {
	
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
		 
		 
		 ActionForward forward = null;
			boolean isModifySuccess = false;
			LectureBean lecture=new LectureBean();
			LectureModifyService lectureModifyService = new LectureModifyService();
			int lecture_no=Integer.parseInt(request.getParameter("LECTURE_NO"));
			
				lecture.setLecture_no(lecture_no);
				lecture.setLecture_name(request.getParameter("LECTURE_NAME"));
				lecture.setLecture_pro(request.getParameter("LECTURE_PRO"));
				lecture.setLecture_grade(Integer.parseInt(request.getParameter("LECTURE_GRADE")));
				lecture.setLecture_dep(request.getParameter("LECTURE_DEP"));
				lecture.setLecture_category(request.getParameter("LECTURE_CATEGORY"));
				lecture.setLecture_score(Integer.parseInt(request.getParameter("LECTURE_SCORE")));
				lecture.setLecture_nop(Integer.parseInt(request.getParameter("LECTURE_NOP")));
				lecture.setLecture_time(request.getParameter("LECTURE_TIME"));
				lecture.setLecture_semester(request.getParameter("LECTURE_SEMESTER"));
				lecture.setLecture_cp(request.getParameter("LECTURE_CP"));
				lecture.setLecture_lp(request.getParameter("LECTURE_LP")); 
				isModifySuccess = lectureModifyService.modifyLecture(lecture);
				
				if(!isModifySuccess){
					response.setContentType("text/html;charset=UTF-8");
					PrintWriter out=response.getWriter();
					out.println("<script>");
					out.println("alert('수정실패');");
					out.println("history.back()");
					out.println("</script>");
				}
				else{
					forward = new ActionForward();
					forward.setRedirect(true);
					forward.setPath("lecture_view.lms?lecture_no="+lecture.getLecture_no());
				}

			

			return forward;
		}
	   		
	 }
	 
