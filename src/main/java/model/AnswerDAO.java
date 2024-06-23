package model;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AnswerDAO {
    private Connection con;
    private PreparedStatement pstmt;
    private ResultSet rs;

    private void dbConnection() {
        try {
            Context initctx = new InitialContext();
            Context envctx = (Context) initctx.lookup("java:comp/env");
            DataSource ds = (DataSource) envctx.lookup("jdbc/pool_2");
            con = ds.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void closeConnection() {
        try {
            if(rs != null) rs.close();
            if(pstmt != null) pstmt.close();
            if(con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<AnswerDTO> getAllAnswersByAboutId(int aboutId) {
        List<AnswerDTO> answers = new ArrayList<>();
        try {
            dbConnection();
            String sql = "SELECT * FROM ANSWER WHERE ABOUT_ID = ? ORDER BY CREATED_AT DESC";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, aboutId);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                AnswerDTO answer = new AnswerDTO();
                answer.setAnswerId(rs.getInt("ANSWER_ID"));
                answer.setAboutId(rs.getInt("ABOUT_ID"));
                answer.setUserId(rs.getString("USERID"));
                answer.setAnswerMessage(rs.getString("ANSWER_MESSAGE"));
                answer.setCreatedAt(rs.getTimestamp("CREATED_AT"));
                answers.add(answer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return answers;
    }

    public List<AnswerDTO> getAllAnswers() {
        List<AnswerDTO> answers = new ArrayList<>();
        try {
            dbConnection();
            String sql = "SELECT * FROM ANSWER ORDER BY CREATED_AT DESC";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                AnswerDTO answer = new AnswerDTO();
                answer.setAnswerId(rs.getInt("ANSWER_ID"));
                answer.setAboutId(rs.getInt("ABOUT_ID"));
                answer.setUserId(rs.getString("USERID"));
                answer.setAnswerMessage(rs.getString("ANSWER_MESSAGE"));
                answer.setCreatedAt(rs.getTimestamp("CREATED_AT"));
                answers.add(answer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return answers;
    }

    public boolean insertAnswer(AnswerDTO answer) {
        boolean success = false;
        try {
            dbConnection();
            String sql = "INSERT INTO ANSWER (ABOUT_ID, USERID, ANSWER_MESSAGE) VALUES (?, ?, ?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, answer.getAboutId());
            pstmt.setString(2, answer.getUserId());
            pstmt.setString(3, answer.getAnswerMessage());
            int result = pstmt.executeUpdate();
            if(result > 0) success = true;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return success;
    }
}
