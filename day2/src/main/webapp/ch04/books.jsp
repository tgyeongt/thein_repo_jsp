<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- DTO: 데이터 전송 담당	 -->
<%@ page import="dto.Book"%>
<!-- DAO: 저장된 데이터 가져오기-DTO 구조를 사용. -->
<jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>도서 목록</title>
<style>
    .container{
        display: flex;      /* 가로 정렬 */
        width: 100%;
        gap: 10px;          /* 박스 사이 간격 */
    }
    .box{
        flex: 1;           /* 3칸 동일 비율 */
        border: 1px solid black;
        padding: 20px;
        text-align: center;
    }
</style>
</head>
<body>
	<div>
		<%@ include file="menu.jsp"%>

		<div>
			<div>
				<h1>도서목록</h1>
			</div>
		</div>
		<%
ArrayList<Book> listOfBooks = bookDAO.getAllBooks();
%>
    <div class="container"> 
		<%
		for(int i=0; i < listOfBooks.size();  i++){
			Book book = listOfBooks.get(i);
		
		%>
		
		    <div class="box">
            <h5><b><%= book.getName()%></b></h5>
            <p><%= book.getAuthor() %></p>
            <br><%= book.getPublisher() %>
             | <%= book.getReleaseDate() %>
            <p><%= book.getDescription() %></p>
            <p><%= book.getUnitPrice() %></p>
            
            </div>
       
		<%} %>
		

			
		</div>
		<%@ include file="footer.jsp" %>
	</div>
</body>
</html>
