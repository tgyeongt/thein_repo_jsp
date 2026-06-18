<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인사페이지: 결과</title>
</head>
<body>
	<h1>hello world</h1>
	<%
	String name = request.getParameter("username");
	if (name == null || name.trim().isEmpty()) {
		name = "익명";
	}
	%>

	<h2>안녕하세요, <%=name%>님! </h2>
	<p>JSP가 여러분의 이름을 받아서 출력했어요.</p>
	<a href="index.jsp">다시 입력하기</a>


</body>
</html>