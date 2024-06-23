<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 처리</title>
</head>
<body>
<%
String userID = request.getParameter("userID");
String userPassword = request.getParameter("password");

out.println("UserID: " + userID + "<br>");
out.println("Password: " + userPassword + "<br>");

String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
String dbUser = "system";
String dbPassword = "1234";

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
    Class.forName("oracle.jdbc.OracleDriver");
    conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
    out.println("Database connection successful.<br>");
    
    String sql = "SELECT * FROM USERS WHERE userID=? AND userPassword=?";
    out.println("SQL Query: " + sql + "<br>");
    
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, userID);
    pstmt.setString(2, userPassword);
    
    rs = pstmt.executeQuery();
    
    if (rs.next()) {
        HttpSession session2 = request.getSession();
        session.setAttribute("USERID", userID);
        
        if ("admin".equals(userID)) {
            out.println("관리자 로그인 성공<br>");
            response.sendRedirect("adminMain.jsp");
        } else {
            out.println("일반 사용자 로그인 성공<br>");
            response.sendRedirect("main.jsp");
        }
    } else {
        out.println("로그인 실패. 다시 시도하십시오.<br>");
    }
} catch (Exception e) {
    e.printStackTrace();
    out.println("Exception: " + e.getMessage() + "<br>");
} finally {
    if (rs != null) {
        try {
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("ResultSet close exception: " + e.getMessage() + "<br>");
        }
    }
    if (pstmt != null) {
        try {
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("PreparedStatement close exception: " + e.getMessage() + "<br>");
        }
    }
    if (conn != null) {
        try {
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("Connection close exception: " + e.getMessage() + "<br>");
        }
    }
}
%>
</body>
</html>