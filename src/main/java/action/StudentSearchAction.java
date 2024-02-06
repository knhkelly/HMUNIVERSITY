package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.StudentListService;
import vo.ActionForward;
import vo.StudentBean;

public class StudentSearchAction implements Action{


	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		int option = Integer.parseInt(request.getParameter("type"));
        String searchWord = request.getParameter("searchWord");
		
        ActionForward forward = null;
        
        forward = new ActionForward();
        StudentListService studentSearchService = new StudentListService();
        ArrayList<StudentBean> studentSearchResult = studentSearchService.getSearchList(option,searchWord);
        
        session.setAttribute("studentSearchList", studentSearchResult);
        
		return forward;
	}
}