<%-- 
    Document   : test
    Created on : Apr 23, 2022, 8:01:30 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.io.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        
        <%
            try{
                Class.forName("oracle.jdbc.OracleDriver");
            }catch(ClassNotFoundException e){
                e.printStackTrace(new java.io.PrintWriter(out));
            }
            
           String info = request.getParameter("rApplicant_Citi_No");
           out.println(info);

//            String info = "hello";
           
           
            Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE",
                "c##ankush", "ankush");
            
            Statement stm = connection.createStatement();
            
            stm.executeUpdate("insert into tablea values('" + info + "')"); 
            ResultSet res = stm.executeQuery("select * from tablea");
            
            while(res.next()){
                String r = res.getString(1);
                out.println(r + " <br>");
            }
            
        %>
        
    </body>
</html>
