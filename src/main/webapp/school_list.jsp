<%@page import="model.ResDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.ResDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>봉양면 학교 정보 목록</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f5f5f5;
        margin: 0;
        padding: 20px;
        color: #333;
    }
    h1 {
        color: #2c3e50;
        margin-bottom: 20px;
        text-align: center;
    }
    button {
        background-color: #3498db;
        color: #fff;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
        margin-right: 10px;
    }
    button:hover {
        background-color: #2980b9;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    th, td {
        border: 1px solid #ccc;
        padding: 10px;
        text-align: center;
    }
    th {
        background-color: #3498db;
        color: #fff;
    }
    td a {
        color: #3498db;
        text-decoration: none;
    }
    td a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    ResDAO rdao = new ResDAO();
    ArrayList<ResDTO> list = rdao.allSchoolInfo();
%>
<h1>봉양면 학교 정보 목록</h1>
<button onclick="location.href='main.jsp'">홈으로</button>

<table>
    <thead>
        <tr>
            <th>학교이름</th>
            <th>전화번호</th>
            <th>위치</th>
            <th>학교상징</th>
            <th>학교소개</th>
        </tr>
    </thead>
    <tbody>
<%
    for(int i = 0; i < list.size(); i++) {
        ResDTO rdto = list.get(i);
%>
        <tr>
            <td><a href="school_list_update.jsp?Name=<%=rdto.getName() %>"><%=rdto.getName() %></a></td>
            <td><%=rdto.getTel() %></td>
            <td><%=rdto.getLoc() %></td>
            <td><%=rdto.getSimbol() %></td>
            <td><%=rdto.getIntro() %></td>
        </tr>
<%
    }
%>
    </tbody>
</table>
<%@ include file="footer.jsp"%>
</body>
</html>
