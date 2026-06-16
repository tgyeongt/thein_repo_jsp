<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
  </head>
  <body>
    <jsp:useBean id="person" class="cho4.com.dao.Person" scope="request"></jsp:useBean>
      <p>아이디: <%= person.getId() %></p>
	  <p>이&nbsp;&nbsp;름: <%= person.getName() %></p>
	  <% 
	  person.setId(20230999);
	  person.setName("일지매");
	  %>
	  <jsp:include page="useBean03.jsp"></jsp:include>
    
  </body>
</html>
