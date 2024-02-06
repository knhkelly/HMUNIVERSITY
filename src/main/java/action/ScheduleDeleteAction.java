package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.LectureDeleteService;
import svc.ScheduleDeleteService;
import vo.ActionForward;

public class ScheduleDeleteAction implements Action{

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      ActionForward forward = null;
      
         String deleteSchedule = request.getParameter("schedule_num");
         ScheduleDeleteService scheduleDeleteService = new ScheduleDeleteService();
         
         int deleteResult = scheduleDeleteService.deleteLecture(Integer.parseInt(deleteSchedule));
         
         if(deleteResult > 0) {
        	response.setContentType("text/html;charset=utf-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('일정 삭제 완료.');");
            out.println("location.href = 'main.jsp';");
            out.println("</script>");
         }else{
            response.setContentType("text/html; charset = utf-8");
            PrintWriter out = response.getWriter();
            
            out.println("<script>");
            out.println("alert('일정 삭제 실패.');");
            out.println("location.href = 'main.jsp';");
            out.println("</script>");
         }
      return forward;
   }
   
}