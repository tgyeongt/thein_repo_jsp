<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="golf.GolfMemberDAO"%>
<%@page import="golf.golfModel.TeacherObj"%>
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
    List<TeacherObj> teacherList = (List<TeacherObj>) request.getAttribute("teacherList");

%>
            <h2>강사조회</h2>
            <table>
                <thead>
                    <tr>
                        <th>강사코드</th>
                        <th>강사이름</th>
                        <th>강좌명</th>
                        <th>강사료</th>
                        <th>강사등록일</th>
                    </tr>
                </thead>
                <tbody>
                    <%
    if (teacherList == null || teacherList.isEmpty()) {

%>
                    <tr>
                        <td colspan="5">등록된 강사가 없습니다.</td>
                    </tr>
                    <%

    } else {
        for(TeacherObj m : teacherList) {
            String regDate = m.getTeacher_regist_date();
            if (regDate != null && regDate.length() == 8) {
                regDate = regDate.substring(0, 4) + "년" + regDate.substring(4, 6) + "월" + regDate.substring(6, 8) + "일";
            }

%>
                    <tr>
                        <td><%=m.getTeacher_code()%></td>
                        <td><%=m.getTeacher_name()%></td>
                        <td><%=m.getClass_name()%></td>
                        <td><%=String.format("%,d", m.getClass_price())%></td>
                        <td><%=regDate%></td>
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