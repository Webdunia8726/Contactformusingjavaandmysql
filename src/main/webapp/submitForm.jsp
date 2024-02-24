<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<%
    // Retrieve form data
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String message = request.getParameter("message");

    // Database connection parameters
    String url = "jdbc:mysql://localhost:3306/contactdb";
    String username = "root";
    String password = "rajpatel";

    // Attempt to establish connection
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, username, password);
        
        // SQL query to insert form data into the database
        String sql = "INSERT INTO contacts (name, email, message) VALUES (?, ?, ?)";
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1, name);
        statement.setString(2, email);
        statement.setString(3, message);
        statement.executeUpdate();

        // Close resources
        statement.close();
        conn.close();

        // Redirect to a success page
        response.sendRedirect("success.jsp");
    } catch (Exception e) {
        // Handle any errors
        e.printStackTrace();
        // Redirect to an error page
        response.sendRedirect("error.jsp");
    }
%>
