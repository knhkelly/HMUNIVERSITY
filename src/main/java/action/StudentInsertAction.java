package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import svc.StudentInsertService;
import vo.ActionForward;
import vo.StudentBean;

public class StudentInsertAction implements Action {

		@Override
		public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			StudentBean newStudent = new StudentBean();
			boolean insertResult = false;
			newStudent.setStudent_Id(Integer.parseInt(request.getParameter("student_Id")));
			newStudent.setStudent_Pw(request.getParameter("student_Pw"));
			newStudent.setStudent_Name(request.getParameter("student_Name"));
			newStudent.setStudent_Dep(request.getParameter("student_Dep"));
			newStudent.setStudent_Reg(request.getParameter("student_Reg"));
			newStudent.setStudent_Mail(request.getParameter("student_Mail"));
			newStudent.setStudent_Statu(request.getParameter("student_Statu"));
			newStudent.setStudent_Address(request.getParameter("student_Address"));
			newStudent.setStudent_Phone(request.getParameter("student_Phone"));
			newStudent.setStudent_Gender(request.getParameter("student_Gender"));
			
			
			StudentInsertService studentInsertService = new StudentInsertService();
			insertResult = studentInsertService.insertStudent(newStudent);
			
			ActionForward forward = null;
			if(insertResult == false) {
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				
				out.println("<script>");
				out.println("alert('학생등록실패');");
				out.println("history.back();");
				out.println("</script>");
			}else {
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("../layout.jsp?code=272");
			}
			return forward;
		}
	}


