<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert an Image into MySQL Database</title>
    </head>
    <body>
        <h1>Insert an Image into MySQL Database!</h1>
        <%
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            String url = "jdbc:mysql://localhost:3306/test";//Here the "test" is the Database name
            FileInputStream fis = null;
 
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                conn = DriverManager.getConnection(url, "root", "");
                File image = new File("images/bb.jpg");
                pstmt = conn.prepareStatement("insert into image(Code, Name, Price,Image) " + "values(?,?,?,?)");
                pstmt.setString(1, "A1");
                pstmt.setString(2, "Bag");
                pstmt.setString(3, "100");
                fis = new FileInputStream(image);
                pstmt.setBinaryStream(3, (InputStream) fis, (int) (image.length()));
 
                int count = pstmt.executeUpdate();
                if (count > 0) {
                    System.out.println("The image has been inserted successfully");
                } else {
                    System.out.println("The image did not insert successfully");
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            } finally {
                try {
                    if (rs != null) {
                        rs.close();
                        rs = null;
                    }
                    if (pstmt != null) {
                        pstmt.close();
                        pstmt = null;
                    }
                    if (conn != null) {
                        conn.close();
                        conn = null;
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
 
        %>
    </body>
</html>