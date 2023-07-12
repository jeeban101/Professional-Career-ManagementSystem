<%@page import="java.sql.*"%>
<%
    String code = request.getParameter("rJobCode");
    String company = request.getParameter("rCompanyCode");
    String name = request.getParameter("rJobName");
    String skills = request.getParameter("rSkills");
    String requirement = request.getParameter("rRequirement");

//    try{
    Class.forName("oracle.jdbc.OracleDriver");

    Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","c##ankush", "ankush");

    PreparedStatement pstm = connection.prepareStatement(
            "insert into job values(?, ?, ? ,? ,? )"
    );
    
    pstm.setString(1, code);
    pstm.setString(2, company);
    pstm.setString(3, name);
    pstm.setString(4, skills);
    pstm.setString(5, requirement);

    pstm.executeUpdate();
    
    out.println("<script> alert(\"User added sucessfully.\");"
            + " window.location = 'index.html'; </script>");
       
%>