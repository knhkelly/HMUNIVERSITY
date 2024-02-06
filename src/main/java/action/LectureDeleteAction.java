package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.LectureDeleteService;
import vo.ActionForward;

public class LectureDeleteAction implements Action{

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      ActionForward forward = null;
      
         String deleteLecture = request.getParameter("lecture_no");
         LectureDeleteService lectureDeleteService = new LectureDeleteService();
         
         int deleteResult = lectureDeleteService.deleteLecture(Integer.parseInt(deleteLecture));
         
         if(deleteResult >0) {
        	response.setContentType("text/html;charset=utf-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('강의 삭제 완료.');");
            out.println("location.href = 'layout.jsp?code=282';");
            out.println("</script>");
         }else if(deleteResult == 0){
            response.setContentType("text/html; charset = utf-8");
            PrintWriter out = response.getWriter();
            
            out.println("<script>");
            out.println("alert('강의 삭제 실패.');");
            out.println("location.href = 'layout.jsp?code=282';");
            out.println("</script>");
         }else if(deleteResult < 0){
        	response.setContentType("text/html; charset = utf-8");
            PrintWriter out = response.getWriter();
             
            out.println("<script>");
            out.println("alert('수강중인 학생이 있어 강의를 삭제할 수 없습니다.');");
            out.println("location.href = 'layout.jsp?code=282';");
            out.println("</script>");
         }
      
      return forward;
   }
   
}