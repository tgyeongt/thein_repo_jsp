package golf;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import golf.golfModel.MemberObj;
import golf.golfModel.ProfitObj;
import golf.golfModel.TeacherObj;

@WebServlet("/golf/list")
public class GolfListServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private final GolfMemberDAO dao = new GolfMemberDAO();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		if (action == null) {
			action = "list";
		}

		try {
			switch (action) {
			case "teacher":
				List<TeacherObj> teacherList = dao.getTeacherList();
				req.setAttribute("teacherList", teacherList);
				forward(req, resp, "/golf/teacher.jsp");
				break;
			case "member":
				List<MemberObj> memberList = dao.getEnrolledMemberList();
				req.setAttribute("memberList", memberList);
				forward(req, resp, "/golf/member.jsp");
				break;
			case "apply":
				List<MemberObj> applyMemberList = dao.getMemberList();
				List<TeacherObj> applyTeacherList = dao.getTeacherList();
				req.setAttribute("memberList", applyMemberList);
				req.setAttribute("teacherList", applyTeacherList);
				forward(req, resp, "/golf/applyCourse.jsp");
				break;
			case "profit":
				List<ProfitObj> profitList = dao.getProfitList();
				req.setAttribute("profitList", profitList);
				forward(req, resp, "/golf/profit.jsp");
				break;
			case "form":
				forward(req, resp, "/golf/form.jsp");
				break;
			default:
				resp.sendRedirect(req.getContextPath() + "/ex6/member");
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("errorMsg", e.getMessage());
			forward(req, resp, "/ex6/error.jsp");
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		try {
			String registMonth = req.getParameter("regist_month");
			String cNo = req.getParameter("c_no");
			String classArea = req.getParameter("class_area");
			String teacherCode = req.getParameter("teacher_code");
			int tuition = Integer.parseInt(req.getParameter("tuition"));


			if ("insert".equals(action)) {
				dao.insertClass(registMonth, cNo, classArea, tuition, teacherCode);
			}
			resp.sendRedirect(req.getContextPath() + "/golf/list?action=member");
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("errorMsg", e.getMessage());
			forward(req, resp, "/golf/list?action=apply"); // forward back to form on error (or error page)
		}
	}



	private void forward(HttpServletRequest req, HttpServletResponse resp, String path)
			throws ServletException, IOException {
		req.getRequestDispatcher(path).forward(req, resp);
	}
}
