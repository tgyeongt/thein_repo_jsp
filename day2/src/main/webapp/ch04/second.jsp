<%@page import="java.util.Date"%> <%@ page language="java"
contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
  </head>
  <body>
    <%--
    <h3>이 파일은 second.jsp입니다</h3>
    Today is : <%= new Date()%> --%>

    <!-- p129 Param -->
    <h3>오늘의 날짜 및 시간</h3>
    <!-- name="date": date변수로 넘어옴. -->
    <p><%= request.getParameter("date")%></p>
    
  </body>
</html>
