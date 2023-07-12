<%@page import="java.sql.*"%>
<%
    String admin_id = request.getParameter("rAdminId");
    String pass = request.getParameter("rAdminPassword");
    String name = request.getParameter("rAdminName");
    String type = request.getParameter("rAdminType");

//    try{
    Class.forName("oracle.jdbc.OracleDriver");

    Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","c##ankush", "ankush");

    PreparedStatement pstm = connection.prepareStatement(
            "insert into admin values(?, ?, ? ,?)"
    );
    
    pstm.setString(1, admin_id);
    pstm.setString(2, pass);
    pstm.setString(3, name);
    pstm.setString(4, type);

    pstm.executeUpdate();
    
    out.println("<script> alert(\"User added sucessfully.\");"
            + " window.location = 'index.html'; </script>");
       
%>

