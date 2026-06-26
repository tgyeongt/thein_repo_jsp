package golf;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import golf.golfModel.MemberObj;
import golf.golfModel.ProfitObj;
import golf.golfModel.TeacherObj;

public class GolfMemberDAO {

	public List<TeacherObj> getTeacherList() throws Exception {
		List<TeacherObj> list = new ArrayList<>();
		String sql = "select * from golf_teacher";
		try (Connection conn = DBConnectionManager.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {
			while (rs.next()) {
				TeacherObj teacher = new TeacherObj();
				teacher.setTeacher_code(rs.getString("teacher_code"));
				teacher.setTeacher_name(rs.getString("teacher_name"));
				teacher.setClass_name(rs.getString("class_name"));
				teacher.setClass_price(rs.getInt("class_price"));
				teacher.setTeacher_regist_date(rs.getString("teacher_regist_date"));
				list.add(teacher);
			}
		}
		return list;
	}

	public List<MemberObj> getEnrolledMemberList() throws Exception {
		List<MemberObj> list = new ArrayList<>();
		String sql = """
				SELECT c.regist_month, c.c_no, m.c_name,
				               t.class_name, c.class_area, c.tuition, m.grade
				        FROM golf_class c
				        JOIN golf_member m ON c.c_no = m.c_no
				        Join golf_teacher t on c.teacher_code = t.teacher_code
				""";
		try (Connection conn = DBConnectionManager.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {
			while (rs.next()) {
				MemberObj member = new MemberObj();
				member.setRegist_month(rs.getString("regist_month"));
				member.setC_no(rs.getString("c_no"));
				member.setC_name(rs.getString("c_name"));
				member.setClass_name(rs.getString("class_name"));
				member.setClass_area(rs.getString("class_area"));
				member.setTuition(rs.getInt("tuition"));
				member.setGrade(rs.getString("grade"));
				list.add(member);
			}
		}
		return list;
	}

	public List<MemberObj> getMemberList() throws Exception {
		List<MemberObj> list = new ArrayList<>();
		String sql = "SELECT c_no, c_name FROM golf_member";
		try (Connection conn = DBConnectionManager.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {
			while (rs.next()) {
				MemberObj member = new MemberObj();
				member.setC_no(rs.getString("c_no"));
				member.setC_name(rs.getString("c_name"));
				list.add(member);
			}
		}
		return list;
	}

	public List<ProfitObj> getProfitList() throws Exception {
		List<ProfitObj> list = new ArrayList<>();
		String sql = """
							SELECT t.teacher_code, t.class_name, t.teacher_name,
				               sum(c.tuition) as profit
				        FROM golf_teacher t
				        Join golf_class c on c.teacher_code = t.teacher_code
				        group by t.teacher_code, t.class_name, t.teacher_name
				        order by t.teacher_code asc
				""";
		try (Connection conn = DBConnectionManager.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {
			while (rs.next()) {
				ProfitObj profit = new ProfitObj();
				profit.setTeacher_code(rs.getString("teacher_code"));
				profit.setTeacher_name(rs.getString("teacher_name"));
				profit.setClass_name(rs.getString("class_name"));
				profit.setProfit(rs.getInt("profit"));
				list.add(profit);
			}
		}
		return list;
	}

	public int insertClass(String regist_month, String c_no, String class_area, int tuition, String teacher_code) throws Exception {
		String sql = """
				INSERT INTO golf_class
				(regist_month, c_no, class_area, tuition, teacher_code)
				VALUES (?, ?, ?, ?, ?)
				""";
		try (Connection conn = DBConnectionManager.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, regist_month);
			pstmt.setString(2, c_no);
			pstmt.setString(3, class_area);
			pstmt.setInt(4, tuition);
			pstmt.setString(5, teacher_code);
			System.out.println("인서트 성공!");
			return pstmt.executeUpdate();
		}
	}
}
