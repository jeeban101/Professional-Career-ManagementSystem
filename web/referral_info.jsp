<%@page import="java.sql.*"%>
<%
    Integer citizenship = Integer.parseInt(request.getParameter("rApplicant_Citi_No"));
    String reference = request.getParameter("rReferenceNo");
    String name = request.getParameter("rReferenceName");
    String email = request.getParameter("rEmailId");
    String working = request.getParameter("rWorkingAt");
    String designation = request.getParameter("rDesignation");

//    try{
    Class.forName("oracle.jdbc.OracleDriver");

    Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","c##ankush", "ankush");

    PreparedStatement pstm = connection.prepareStatement(
            "insert into referral values(?, ?, ? ,?, ?, ?)"
    );
    
    pstm.setInt(2, citizenship);
    pstm.setString(1, reference);
    pstm.setString(3, name);
    pstm.setString(4, email);
    pstm.setString(5,working);
    pstm.setString(6,designation);
    
    pstm.executeUpdate();
    
    out.println("<script> alert(\"User added sucessfully.\");"
            + " window.location = 'index.html'; </script>");
       
%>