package vote;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
 
import vote.model.MemberObj;
import vote.model.RankObj;
import vote.model.VoteCheckObj;
 
@WebServlet("/vote/list")
public class VoteServlet extends HttpServlet {
 
    private static final long serialVersionUID = 1L;
    private final VoteDAO dao = new VoteDAO();
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
 
        if(action == null || action.isEmpty()) action = "list";
 
        try {
            switch(action) {
                case "rank":
                    List<RankObj> rankList = dao.getRankList();
                    req.setAttribute("rankList", rankList);
                    forward(req,resp,"/vote/rank.jsp");
                    break;
                case "member":
                    List<MemberObj> memberList = dao.getMemberList();
                    req.setAttribute("memberList", memberList);
                    forward(req,resp,"/vote/member.jsp");
                    break;
                case "voteCheck":
                    List<VoteCheckObj> voteList = dao.getVoteList();
                    req.setAttribute("voteList", voteList);
                    forward(req,resp,"/vote/voteCheck.jsp");
                    break;
                case "doVote":
                    List<MemberObj> memberVoteList = dao.getMemberList();
                    req.setAttribute("memberVoteList", memberVoteList);
                    forward(req,resp,"/vote/doVote.jsp");
                    break;
                default:
                    resp.sendRedirect(req.getContextPath() + "/vote/main.jsp");
                }
            } 
            catch(Exception e){
                e.printStackTrace();
                req.setAttribute("errorMsg", e.getMessage());
                forward(req,resp,"/vote/error.jsp");
            }
    }

    @Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		try {
			String v_jumin = req.getParameter("v_jumin");
			String v_name = req.getParameter("v_name");
			String m_no = req.getParameter("m_no");
			String v_time = req.getParameter("v_time");
            String v_area = req.getParameter("v_area");
            String v_confirm = req.getParameter("v_confirm");
			

			if ("insert".equals(action)) {
				dao.insertVote(v_jumin,v_name,m_no,v_time,v_area,v_confirm);
			} 
			resp.sendRedirect(req.getContextPath() + "/vote/list?action=voteCheck");
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("errorMsg", e.getMessage());
			forward(req, resp, "/vote/list?action=doVote"); // forward back to form on error (or error page)
		}
	}
 
    private void forward(HttpServletRequest req, HttpServletResponse resp, String path)
			throws ServletException, IOException {
		req.getRequestDispatcher(path).forward(req, resp);
	}
    
}
