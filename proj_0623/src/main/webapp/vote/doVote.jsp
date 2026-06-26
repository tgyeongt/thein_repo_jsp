<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="golf.GolfMemberDAO"%>
<%@page import="vote.model.MemberObj"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>투표하기</title>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <%@ include file="nav.jsp" %>
        <%
    List<MemberObj> memberList = (List<MemberObj>) request.getAttribute("memberVoteList");

%>
        <h2>투표하기</h2>
        <form action="list?action=insert" method="post">
            <p>주민번호: <input type="text" name="v_jumin" id="v_jumin" placeholder="13자리 주민번호 입력"></p>
            <p>성명: <input type="text" name="v_name" id="v_name" placeholder="성명 입력"></p>
            <p>투표 번호:
            <select name="m_no" id="m_no" onchange="updateMNo(this.value)">
                <option value="">-- 투표 번호 --</option>
                <%
    if (memberList != null) {
        for (MemberObj m : memberList) {

%>
                <option value="<%=m.getM_no()%>"> [<%=m.getM_no()%>] <%=m.getM_name()%></option>
                <%

    }
    }

%>
            </select>
        </p>
        <p>투표시간: <input type="text" name="v_time" id="v_time"></p>
        <p>투표장소: <input type="text" name="v_area" id="v_area"></p>
        <p>유권자확인: <input type="radio" name="v_confirm" value="Y">확인
        <input type="radio" name="v_confirm" value="N">미확인

    </p>

</p>

<button type="submit">투표하기</button>
<button type="reset">다시쓰기</button>
</form>

<script>
            function updateMNo(m_no) {
                document.getElementById("m_no").value = m_no;
            }
        </script>

<%@ include file="footer.jsp" %>
</body>
</html>