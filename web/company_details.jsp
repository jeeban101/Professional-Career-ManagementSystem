<%@page import="java.sql.*"%>
<%
    String code = request.getParameter("rCompanyCode");
    String admin_id = request.getParameter("rAdminId");
    String name = request.getParameter("rCompanyName");
    String address = request.getParameter("rLocation");
    String establish_date = request.getParameter("rEstablishedDate");
    String ceo = request.getParameter("rCeo");
    String hr = request.getParameter("rHrHead");
    
    java.sql.Date dateEsta = java.sql.Date.valueOf(establish_date);
//    try{
    Class.forName("oracle.jdbc.OracleDriver");

    Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","c##ankush", "ankush");

    PreparedStatement pstm = connection.prepareStatement(
            "insert into company values(?, ?, ? ,? ,? ,? ,?)"
    );
    
    pstm.setString(1, code);
    pstm.setString(2, admin_id);
    pstm.setString(3, name);
    pstm.setString(4, address);
    pstm.setDate(5, dateEsta);
    pstm.setString(6,ceo);
    pstm.setString(7,hr);
    
    pstm.executeUpdate();
    
    out.println("<script> alert(\"User added sucessfully.\");"
            + " window.location = 'index.html'; </script>");
       
%>