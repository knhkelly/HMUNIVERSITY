package action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.LectureListService;
import vo.ActionForward;
import vo.LectureBean;

public class LectureSearchAction implements Action {
    
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        int option = Integer.parseInt(request.getParameter("option"));
        String searchWord = request.getParameter("searchWord");
        
        ActionForward forward = null;
        
            forward = new ActionForward();
            LectureListService lectureListService = new LectureListService();
            ArrayList<LectureBean> lectureSearchList = lectureListService.getSearchList(option,searchWord);
                
                session.setAttribute("lectureSearchList", lectureSearchList);
                forward.setRedirect(true);
                forward.setPath("./layout.jsp?code=282");
                
                return forward;
	}
}