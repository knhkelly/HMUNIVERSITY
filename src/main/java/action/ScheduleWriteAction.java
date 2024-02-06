package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BoardWriteProService;
import svc.ScheduleWriteService;
import vo.ActionForward;
import vo.ScheduleBean;

public class ScheduleWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		ScheduleBean scheduleBean = null;
		
		ScheduleWriteService miniBoardWriteService = new ScheduleWriteService();
		
		scheduleBean = new ScheduleBean();
		scheduleBean.setSchedule_content(request.getParameter("content"));
		
		boolean isWriteSuccess = miniBoardWriteService.scheduleInsertService(scheduleBean);
		if (isWriteSuccess == false) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println("alert('일정등록실패');");
			out.println("history.back();");
			out.println("</script>");
		}
		else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./main.jsp");
		}
		
		return forward;
	}

}
