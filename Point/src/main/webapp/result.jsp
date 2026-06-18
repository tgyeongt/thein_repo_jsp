<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	double num1 = Double.parseDouble(request.getParameter("num1"));
	double num2 = Double.parseDouble(request.getParameter("num2"));
	String op = request.getParameter("op");

	double result = 0;
	boolean error = false;

	switch (op) {
		case "+":
			result = num1 + num2;
			break;
		case "-":
			result = num1 - num2;
			break;
		case "*":
			result = num1 * num2;
			break;
		case "/":
			if (num2 == 0) {
				error = true;
			} else {
				result = num1 / num2;
			}
			break;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계산 결과</title>
</head>
<body>
<h2>계산 결과</h2>

<% if (error) { %>
	<p style="color: red">0으로 나눌 수 없습니다.</p>
<% } else { %>
	<p><%= num1 %> <%= op %> <%= num2 %> = <%= result %></p>
<% } %>

<br/>
<a href="cal.jsp">다시 계산하기</a>

</body>
</html>