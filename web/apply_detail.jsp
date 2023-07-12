<%@page import="java.sql.*"%>
<%
    Integer citizenship = Integer.parseInt(request.getParameter("rCitizen_Code"));
    String code = request.getParameter("rJobCode");

//    try{
    Class.forName("oracle.jdbc.OracleDriver");

    Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","c##ankush", "ankush");

    PreparedStatement pstm = connection.prepareStatement(
            "insert into applicant_job values(?, ?)"
    );
    
    pstm.setInt(1, citizenship);
    pstm.setString(2, code);

    pstm.executeUpdate();
    
    out.println("<script> alert(\"User added sucessfully.\");"
            + " window.location = 'index.html'; </script>");
       
%>
