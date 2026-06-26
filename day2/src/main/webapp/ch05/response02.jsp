<%@page import="org.apache.naming.java.javaURLContextFactory"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	response.setIntHeader("Refresh", 5);
	%>
	<p>
		<%=(new java.util.Date())%>
</body>
</html>