<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="golf.GolfMemberDAO"%>
<%@page import="golf.golfModel.ProfitObj"%>
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
    List<ProfitObj> profitList = (List<ProfitObj>) request.getAttribute("profitList");

%>
            <h2>매출조회</h2>
            <table>
                <thead>
                    <tr>
                        <th>강사코드</th>
                        <th>강사명</th>
                        <th>강좌명</th>
                        <th>총매출</th>
                    </tr>
                </thead>
                <tbody>
                    <%
    if (profitList == null || profitList.isEmpty()) {

%>
                    <tr>
                        <td colspan="5">등록된 매출이 없습니다.</td>
                    </tr>
                    <%

    } else {
        for(ProfitObj m : profitList) {

%>
                    <tr>
                        <td><%=m.getTeacher_code()%></td>
                        <td><%=m.getTeacher_name()%></td>
                        <td><%=m.getClass_name()%></td>
                        <td><%=String.format("%,d", m.getProfit())%></td>
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