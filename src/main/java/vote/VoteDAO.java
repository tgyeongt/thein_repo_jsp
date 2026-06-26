package vote;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import vote.model.MemberObj;
import vote.model.RankObj;
import vote.model.VoteCheckObj;

public class VoteDAO {

    // private String m_no;
	// private String m_name;
	// private int rank;
	public List<RankObj> getRankList() throws Exception{
		List<RankObj> list = new ArrayList<>();
		String sql = """
        select m.m_no, m.m_name, count(*) as rank
        from vote_member m join vote_vote v
        on m.m_no = v.m_no
        group by m.m_no, m.m_name
        order by rank desc
		""";
        try(Connection conn = DBConnectionManager.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs=pstmt.executeQuery()) {
            while (rs.next()) {
                RankObj rank = new RankObj();
                rank.setM_name(rs.getString("m_name"));
                rank.setM_no(rs.getString("m_no"));
                rank.setRank(rs.getInt("rank"));
                list.add(rank);
            }
        }
        return list;
	}

    //성명 (생년월ㅇ리 나이 성별) 후보번호 투표시간 유권자확인
    public List<VoteCheckObj> getVoteList() throws Exception{
		List<VoteCheckObj> list = new ArrayList<>();
		String sql = """
        select v_name, v_jumin, m_no, v_time, v_confirm
        from vote_vote;
		""";
        try(Connection conn = DBConnectionManager.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs=pstmt.executeQuery()) {
            while (rs.next()) {
                VoteCheckObj vote = new VoteCheckObj();
                vote.setV_name(rs.getString("v_name"));
                vote.setV_jumin(rs.getString("v_jumin"));
                vote.setM_no(rs.getString("m_no"));
                vote.setV_time(rs.getString("v_time"));
                vote.setV_confirm(rs.getString("v_confirm"));
                list.add(vote);
            }
        }
        return list;
	}
    //후보번호 성명 소속정당 학력 주민번호 지역구 대표전화
    public List<MemberObj> getMemberList() throws Exception{
		List<MemberObj> list = new ArrayList<>();
		String sql = """
        select m.m_no, m.m_name, m.p_code, m.p_school, m.m_jumin, m.m_city, p.p_tel1, p.p_tel2, p.p_tel3
        from vote_member m join vote_party p
        on m.p_code = p.p_code
        order by m.m_no
		""";
        try(Connection conn = DBConnectionManager.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs=pstmt.executeQuery()) {
            while (rs.next()) {
                MemberObj member = new MemberObj();
                member.setM_no(rs.getString("m_no"));
                member.setM_name(rs.getString("m_name"));
                member.setP_code(rs.getString("p_code"));
                member.setP_school(rs.getString("p_school"));
                member.setM_jumin(rs.getString("m_jumin"));
                member.setM_city(rs.getString("m_city"));
                member.setM_tel(rs.getString("p_tel1")+"-"+rs.getString("p_tel2")+"-"+rs.getString("p_tel3"));
                list.add(member);
            }
        }
        return list;
	}

    public void insertVote(String v_jumin, String v_name, String m_no, String v_time, String v_area, String v_confirm)throws Exception{
		String sql = """
        insert into vote_vote(v_jumin,v_name,m_no,v_time,v_area,v_confirm)
        values(?,?,?,?,?,?)
		""";
        try(Connection conn = DBConnectionManager.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1,v_jumin);
            pstmt.setString(2,v_name);
            pstmt.setString(3,m_no);
            pstmt.setString(4,v_time);
            pstmt.setString(5,v_area);
            pstmt.setString(6,v_confirm);
            pstmt.executeUpdate();
        }
        System.out.println("투표가 완료되었습니다.");
	}

}
