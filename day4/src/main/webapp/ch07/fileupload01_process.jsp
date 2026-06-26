<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
    </head>
    <body>
        <%
    String savePath = System.getProperty("user.home") + "/uploads";
    File uploadDir = new File(savePath);
    if (!uploadDir.exists()) {
        uploadDir.mkdirs();
    }
    MultipartRequest multi = new MultipartRequest(request, savePath, 5*1024*1024, "UTF-8", new DefaultFileRenamePolicy());

    String name = multi.getParameter("name");
    String title = multi.getParameter("title");
    String filename = "";

    Enumeration params = multi.getParameterNames();
    while (params.hasMoreElements()) {
        String pName = (String) params.nextElement();
        String value = multi.getParameter(pName);
        out.println(pName + "=" + value + "<br>");
    }
    Enumeration files = multi.getFileNames();
    while (files.hasMoreElements()) {
        String fName = (String) files.nextElement();
        filename = multi.getFilesystemName(fName);
        String originalfilename = multi.getOriginalFileName(fName);
        String type = multi.getContentType(fName);
        File file = multi.getFile(fName);
        out.println("요청 파라미터 이름 : " + fName + "<br>");
        out.println("파일 이름 : " + filename + "<br>");
        out.println("파일 실제 이름 : " + originalfilename + "<br>");
        out.println("파일 타입 : " + type + "<br>");
        out.println("파일 크기 : " + file.length() + "<br>");
        out.println("파일 경로 : " + file.getAbsolutePath() + "<br>");
    }

%>
        <p>이름 : <%= name %></p>
        <p>제목 : <%= title %></p>
        <p>파일명 : <%= filename %></p>
    </body>
</html>