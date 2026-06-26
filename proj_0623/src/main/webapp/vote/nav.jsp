<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
        <style>
nav ul {
  list-style: none;      /* 리스트 점 제거 */
  padding: 0;
  margin: 0;
  display: flex;         /* 가로 정렬 */
  background-color: #333;
}

nav li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 20px;
  text-decoration: none; /* 밑줄 제거 */
}

/* 마우스 올렸을 때 효과 */
nav li a:hover {
  background-color: #111;
}
</style>
    </head>
    <body>
        <li><a href="list?action=member">후보조회</a></li>
        <li><a href="list?action=doVote">투표하기</a></li>
        <li><a href="list?action=voteCheck">투표검수조회</a></li>
        <li><a href="list?action=rank">후보자등수</a></li>
        <li><a href="main.jsp">홈으로</a></li>
    </body>
</html>