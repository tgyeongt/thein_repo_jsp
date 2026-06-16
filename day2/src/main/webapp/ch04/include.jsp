<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
  </head>
  <body>
  
  	<!-- 최신 Tomcat/Jakarta 환경: TRUE처럼 동작이 보임. -->
  
  	<!-- <jsp:include> 는 실행 시점(runtime) -->
    <h2>include 액션 태그</h2>
    
    <!-- 현재 JSP가 가지고 있는 버퍼(buffer) 내용을 먼저 브라우저로 전송(flush) 
    	 그 다음 include_date.jsp 실행 후 결과를 포함
    -->
    <jsp:include page="include_date.jsp" flush="true"></jsp:include>
    
    <!-- 현재 버퍼를 비우지 않고(include 전에 전송 안 함)
    	 그대로 include_date.jsp 실행 후 결과를 합쳐서 나중에 한 번에 출력
     -->
    <%-- <jsp:include page="include_date.jsp" flush="false"></jsp:include> --%> 
    <p>--------------------</p>
  </body>
</html>
