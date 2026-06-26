<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="vote.VoteDAO"%>
<%@page import="vote.model.MemberObj"%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>후보 조회</title>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <%@ include file="nav.jsp" %>


        <section>
            <h1>후보 조회</h1>
            <%
    List<MemberObj> memberList = (List<MemberObj>) request.getAttribute("memberList");

%>
            <table>
                <thead>
                    <tr>
                        <th>후보번호</th>
                        <th>성명</th>
                        <th>소속정당</th>
                        <th>학력</th>
                        <th>주민번호</th>
                        <th>지역구</th>
                        <th>대표전화</th>
                    </tr>
                </thead>
                <tbody>
                    <%
    if(memberList == null || memberList.isEmpty()) {

%>
                    <tr>
                        <td colspan="7">등록된 회원이 없습니다.</td>
                    </tr>
                    <%

    } else {
        for(MemberObj m : memberList) {
            String jumin = m.getM_jumin();
            if (jumin != null && jumin.length() == 13) {
                jumin = jumin.substring(0, 6) + "-" + jumin.substring(6);
            }

            String school = "";
            switch(m.getP_school()) {
                case "1": school = "고졸";
                break;
                case "2": school = "학사";
                break;
                case "3": school = "석사";
                break;
                case "4": school = "박사";
                break;
            }

%>
                    <tr>
                        <td><%=m.getM_no()%></td>
                        <td><%=m.getM_name()%></td>
                        <td><%=m.getP_code()%></td>
                        <td><%=school%></td>
                        <td><%=jumin%></td>
                        <td><%=m.getM_city()%></td>
                        <td><%=m.getM_tel()%></td>
                    </tr>
                    <% }} %>
                </tbody>

            </table>
        </section>


        <%@ include file="footer.jsp" %>

    </body>
</html>