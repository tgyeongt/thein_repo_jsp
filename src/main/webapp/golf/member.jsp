<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="golf.GolfMemberDAO"%>
<%@page import="golf.golfModel.MemberObj"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <%@ include file="nav.jsp" %>
        <section>
            <%
    List<MemberObj> memberList = (List<MemberObj>) request.getAttribute("memberList");

%>
            <h2>회원조회</h2>
            <table>
                <thead>
                    <tr>
                        <th>수강월</th>
                        <th>회원번호</th>
                        <th>회원명</th>
                        <th>강의명</th>
                        <th>강의장소</th>
                        <th>수강료</th>
                        <th>등급</th>
                    </tr>
                </thead>
                <tbody>
                    <%
    if (memberList == null || memberList.isEmpty()) {

%>
                    <tr>
                        <td colspan="5">등록된 회원이 없습니다.</td>
                    </tr>
                    <%

    } else {
        for(MemberObj m : memberList) {
            String regDate = m.getRegist_month();
            if (regDate != null && regDate.length() == 6) {
                regDate = regDate.substring(0, 4) + "년 " + regDate.substring(4, 6) + "월";
            }

%>
                    <tr>
                        <td><%=regDate%></td>
                        <td><%=m.getC_no()%></td>
                        <td><%=m.getC_name()%></td>
                        <td><%=m.getClass_name()%></td>
                        <td><%=m.getClass_area()%></td>
                        <td><%=String.format("%,d", m.getTuition())%></td>
                        <td><%=m.getGrade()%></td>
                    </tr>
                    <%

    }
    }

%>
                </tbody>
            </table>
        </section>
        <%@ include file="footer.jsp" %>
    </body>
</html>