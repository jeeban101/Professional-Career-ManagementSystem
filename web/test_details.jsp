<%@page import="java.sql.*"%>
<%
    String code = request.getParameter("rTestCode");
    String company = request.getParameter("rCompanyCOde");
    String test_time = request.getParameter("rTime");
    String location = request.getParameter("rTestLocation");
    String type = request.getParameter("rTestType");
    String test_for = request.getParameter("rTestFor");
    String job_code = request.getParameter("rTestJobCode");
    
    java.sql.Date tim = java.sql.Date.valueOf(test_time);

//    try{
    Class.forName("oracle.jdbc.OracleDriver");

    Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","c##ankush", "ankush");

    Statement stm = connection.createStatement();
    
    if( select.equals("select") ){
        ResultSet rs = stm.executeQuery(code);
    }else{
        int changed = stm.executeUpdate(code);
    }
    
    
    PreparedStatement pstm = connection.prepareStatement(
            "insert into test values(?, ?, ? ,?, ?, ?, ?)"
    );
    
    pstm.setString(1, code);
    pstm.setString(2, company);
    pstm.setDate(3, tim);
    pstm.setString(4, location);
    pstm.setString(5,type);
    pstm.setString(6,test_for);
    pstm.setString(7,job_code);

    pstm.executeUpdate();
    
    out.println("<script> alert(\"User added sucessfully.\");"
            + " window.location = 'index.html'; </script>");
       
%>