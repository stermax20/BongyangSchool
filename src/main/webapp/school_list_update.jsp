<%@page import="model.ResDAO"%>
<%@page import="model.ResDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f5f5f5;
        margin: 0;
        padding: 20px;
        color: #333;
    }
    table {
        width: 50%;
        border-collapse: collapse;
        margin: auto;
        margin-top: 20px;
        margin-bottom: 20px;
    }
    table, th, td {
        border: 1px solid #ccc;
    }
    th, td {
        padding: 10px;
        text-align: center;
    }
    form {
        width: 50%;
        margin: auto;
        padding: 20px;
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        border-radius: 5px;
    }
    input[type="text"] {
        width: calc(100% - 20px);
        padding: 8px;
        margin: 5px 0;
        border: 1px solid #ccc;
        border-radius: 3px;
        box-sizing: border-box;
    }
    input[type="submit"], input[type="button"] {
        background-color: #3498db;
        color: #fff;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
        margin-left: 130px;
    }
    input[type="submit"]:hover, input[type="button"]:hover {
        background-color: #2980b9;
    }
</style>
<script>
function confirmDelete() {
    return confirm('정말 삭제하시겠습니까?');
}
</script>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");

    String Name = request.getParameter("Name");
    ResDAO rdao = new ResDAO();
    ResDTO rdto = rdao.selectName(Name);
%>
<form action="school_list_update_proc.jsp" method="post">
    <table>
        <tr height="50">
            <td align="center" width="120">학교이름 </td>
            <td align="center"><input type="hidden" name="Name" value="<%=rdto.getName() %>">
                <%=rdto.getName()%></td>
        </tr>
        <tr height="50">
            <td align="center" width="120">전화번호 </td>
            <td align="center"><input type="text" name="Tel" size="40"
                    value="<%=rdto.getTel()%>"></td>
        </tr>
        <tr height="50">
            <td align="center" width="120">학교위치 </td>
            <td align="center"><input type="text" name="Loc" size="40"
                    value="<%=rdto.getLoc()%>"></td>
        </tr>
        <tr height="50">
            <td align="center" width="120">학교상징 </td>
            <td align="center"><input type="text" name="Simbol" size="40"
                    value="<%=rdto.getSimbol()%>"></td>
        </tr>
        <tr height="50">
            <td align="center" width="120">학교소개 </td>
            <td align="center"><input type="text" name="Intro" size="40"
                    value="<%=rdto.getIntro()%>"></td>
        </tr>
    </table>
    <input type="submit" value="확인">
    <input type="button" value="삭제" onclick="if(confirmDelete()) location.href='school_list_delete_proc.jsp?Name=<%=rdto.getName() %>';">
    <input type="button" value="취소" onclick="location.href='school_list.jsp'">
</form>
</body>
</html>
