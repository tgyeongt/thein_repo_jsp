<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="golf.GolfMemberDAO"%>
<%@page import="golf.golfModel.MemberObj"%>
<%@page import="golf.golfModel.TeacherObj"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>수강신청</title>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <%@ include file="nav.jsp" %>
        <%
    List<MemberObj> memberList = (List<MemberObj>) request.getAttribute("memberList");
    List<TeacherObj> teacherList = (List<TeacherObj>) request.getAttribute("teacherList");

%>
        <h2>수강신청</h2>
        <form action="list?action=insert" method="post">
            <p>수강월: <input type="text" name="regist_month" id="regist_month" placeholder="수강월 입력 6자리"></p>
            <p>회원명:
            <select id="c_no_select" onchange="updateCNo(this.value)">
                <option value="">-- 회원선택 --</option>
                <%
    if (memberList != null) {
        for (MemberObj m : memberList) {

%>
                <option value="<%=m.getC_no()%>" data-grade="<%=m.getGrade()%>"><%=m.getC_name()%></option>
                <%

    }
    }

%>
            </select>
        </p>
        <p>회원번호: <input type="text" name="c_no" id="c_no" readonly></p>
        <p>강의장소:
        <select name="class_area" id="class_area">
            <option value="본점">본점</option>
            <option value="성남분점">성남분점</option>
            <option value="대전분점">대전분점</option>
            <option value="부산분점">부산분점</option>
            <option value="대구분점">대구분점</option>
            <option value="광주분점">광주분점</option>
        </select>
    </p>
    <p>강의명:
    <select name="teacher_code" id="teacher_code" onchange="calculateTuition()">
        <option value="">-- 강의선택 --</option>
        <%
    if (teacherList != null) {
        for (TeacherObj t : teacherList) {

%>
        <option value="<%=t.getTeacher_code()%>" data-price="<%=t.getClass_price()%>"><%=t.getClass_name()%></option>
        <%

    }
    }

%>
    </select>
</p>
<p>수강료: <input type="text" name="tuition" id="tuition" readonly></p>

<button type="submit">수강신청</button>
<button type="reset">다시쓰기</button>
</form>

<script>
            function updateCNo(c_no) {
                document.getElementById("c_no").value = c_no;
                calculateTuition();
            }
            
            function calculateTuition() {
                var memberSelect = document.getElementById("c_no_select");
                var teacherSelect = document.getElementById("teacher_code");
                
                var selectedMember = memberSelect.options[memberSelect.selectedIndex];
                var selectedTeacher = teacherSelect.options[teacherSelect.selectedIndex];
                
                if (!selectedMember.value || !selectedTeacher.value) {
                    document.getElementById("tuition").value = "";
                    return;
                }
                
                var price = parseInt(selectedTeacher.getAttribute("data-price"));
                var memberNo = selectedMember.value;
                
                var tuition = price;
                if (memberNo && memberNo.startsWith("2")) {
                    tuition = price / 2;
                }
                
                document.getElementById("tuition").value = tuition;
            }
        </script>

<%@ include file="footer.jsp" %>
</body>
</html>