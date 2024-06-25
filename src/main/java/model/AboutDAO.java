package model;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AboutDAO {
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

    public boolean insertAbout(AboutDTO about) {
        boolean success = false;
        try {
            dbConnection();
            String sql = "INSERT INTO ABOUT (USERID, TITLE, MESSAGE) VALUES (?, ?, ?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, about.getUserId());
            pstmt.setString(2, about.getTitle());
            pstmt.setString(3, about.getMessage());
            int result = pstmt.executeUpdate();
            if(result > 0) success = true;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return success;
    }

    public List<AboutDTO> getAllAbouts() {
        List<AboutDTO> abouts = new ArrayList<>();
        try {
            dbConnection();
            String sql = "SELECT * FROM ABOUT ORDER BY CREATED_AT DESC";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                AboutDTO about = new AboutDTO();
                about.setAboutId(rs.getInt("ABOUT_ID"));
                about.setUserId(rs.getString("USERID"));
                about.setTitle(rs.getString("TITLE"));
                about.setMessage(rs.getString("MESSAGE"));
                about.setCreatedAt(rs.getTimestamp("CREATED_AT"));
                abouts.add(about);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return abouts;
    }
}