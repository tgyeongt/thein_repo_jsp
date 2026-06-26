<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="vote.model.RankObj"%>
<%@page import="vote.VoteDAO"%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>후보자 등수</title>
    </head>
    <body>
        <%@include file = "header.jsp"%>
        <%@include file = "nav.jsp"%>
        <section>
            <h1>후보자 등수</h1>
            <%
    List<RankObj> rankList = (List<RankObj>) request.getAttribute("rankList");

%>
            <table>
                <thead>
                    <tr>
                        <th>후보번호</th>
                        <th>성명</th>
                        <th>총 투표건수</th>
                    </tr>
                </thead>
                <tbody>
                    <%
    if(rankList == null || rankList.isEmpty()) {

%>
                    <tr>
                        <td colspan = "3">등록된 후보가 없습니다.</td>
                    </tr>
                    <%

    } else {
        for(RankObj r : rankList) {

%>
                    <tr>
                        <td><%= r.getM_no() %></td>
                        <td><%= r.getM_name() %></td>
                        <td><%= r.getRank() %></td>
                    </tr>
                    <% } } %>
                </tbody>

            </table>
        </section>
    </body>
</html>