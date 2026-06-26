<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/style_ch03.css">
</head>
<body>
	<%! 
	String greeting = "도서 쇼핑몰에 오신 것을 환영합니다."; 
	String tagline = "Welcome to Web Market!";
	%> 
	<div class="root">
	<%@ include file="menu.jsp" %>
		<div class="section">
			<div class="welcome">
				<h3><%= tagline%></h3>
<%
				Date day = new Date();
				String am_pm;
				int hour = day.getHours();
				int minute = day.getMinutes();
				int second = day.getSeconds();
				if(hour / 12==0){
					am_pm = "AM";
				}else{
					am_pm = "PM";
					hour = hour - 12;
				}
String CT = hour + ":" + minute + ":" + second + " " + am_pm;
%>
<div>
	<h4>현재 접속 시간: <%= CT%></h4>
</div>
out.println("현재 접속 시간: " + CT + "\n");

			</div>
		</div>
	<%@ include file="footer.jsp" %>
	</div>
	
</body>
</html>