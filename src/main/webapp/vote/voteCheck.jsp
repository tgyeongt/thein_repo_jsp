<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="vote.model.VoteCheckObj"%>
<%@page import="vote.VoteDAO"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.Period"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>투표 검수 조회</title>
    </head>
    <body>
        <%@ include file="header.jsp"%>
        <%@ include file="nav.jsp"%>
        <section>
            <h1>투표 검수 조회</h1>
            <%
    List<VoteCheckObj> voteList = (List<VoteCheckObj>) request.getAttribute("voteList");

%>
            <table>
                <thead>
                    <tr>
                        <th>성명</th>
                        <th>생년월일</th>
                        <th>나이</th>
                        <th>성별</th>
                        <th>후보번호</th>
                        <th>투표시간</th>
                        <th>유권자확인</th>
                    </tr>
                </thead>
                <tbody>
                    <%
    if (voteList == null || voteList.isEmpty()) {

%>
                    <tr>
                        <td colspan="7">등록된 투표가 없습니다.</td>
                    </tr>
                    <%

    } else {
        for (VoteCheckObj v : voteList) {
            String jumin = v.getV_jumin();
            String birth = "";
            int age = 0;
            String gender = "";
            String check = "";
            String time = "";

            String yy = jumin.substring(0, 2);
            String mm = jumin.substring(2, 4);
            String dd = jumin.substring(4, 6);
            char genderCode = jumin.charAt(6);

            // 2. 성별 구하기 ('남' 또는 '여')
            // 7번째 자리를 숫자로 바꾼 뒤, 홀수면 남, 짝수면 여 (외국인 포함 적용 가능)
            int genderNum = Character.getNumericValue(genderCode);
            gender = (genderNum % 2 != 0) ? "남" : "여";

            // 3. 출생 세기(Year Prefix) 및 만 나이 계산
            String yearPrefix;
            if (genderCode == '1' || genderCode == '2' || genderCode == '5' || genderCode == '6') {
                yearPrefix = "19";
            } else if (genderCode == '3' || genderCode == '4' || genderCode == '7' || genderCode == '8') {
                yearPrefix = "20";
            } else if (genderCode == '9' || genderCode == '0') {
                yearPrefix = "18";
            } else {
                throw new IllegalArgumentException("유효하지 않은 주민등록번호 성별 코드입니다.");
            }

            int birthYear = Integer.parseInt(yearPrefix + yy);
            int birthMonth = Integer.parseInt(mm);
            int birthDay = Integer.parseInt(dd);

            LocalDate birthDate = LocalDate.of(birthYear, birthMonth, birthDay);
            LocalDate currentDate = LocalDate.now();
            // 실행하는 현재 날짜 기준

            // Period가 생일 지남 여부를 판별해 만 나이를 계산해 줌
            age = Period.between(birthDate, currentDate).getYears();
            birth = yearPrefix + "" + yy + "년 " + mm + "월 " + dd + "일생";

            check = v.getV_confirm();
            if (check.equals("Y")) {
                check = "확인";
            } else {
                check = "미확인";
            }

            time = v.getV_time();
            time = time.substring(0, 2) + ":" + time.substring(2, 4);

%>
                    <tr>
                        <td><%=v.getV_name()%></td>
                        <td><%=birth%></td>
                        <td><%=age%></td>
                        <td><%=gender%></td>
                        <td><%=v.getM_no()%></td>
                        <td><%=time%></td>
                        <td><%=check%></td>
                    </tr>
                    <%

    }
    }

%>
                </tbody>

            </table>
        </section>


        <%@ include file="footer.jsp"%>
    </body>
</html>