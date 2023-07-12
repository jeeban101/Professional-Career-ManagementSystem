<%--<%@page import="java.sql.*"%>
<%
    String opt = request.getParameter("rSelect");
    String msg = request.getParameter("rLine");
    
    Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","c##ankush", "ankush");
    
    Statement stm = connection.createStatement();
    
    if( select.equals("select") ){
        ResultSet rs = stm.executeQuery(msg);
        
        
    }else{
        ResultSet changed = stm.executeUpdate(msg);
    }
%>--%>

<%@page import="java.util.*, java.lang.*, java.sql.*, java.io.*"%>

<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <form action="manipulation.jsp" method="post">
            <textarea name="rLine" rows="10" cols="50"></textarea>
            
            <button type="button">Submit</button>
        </form>
    </body>

<%
   
    String text = request.getParameter("rLine");
    text = text.strip();
    
    if(text.endsWith(";")){
        text = text.substring(0, text.length() - 1);
    }
   
    try{
        Class.forName("oracle.jdbc.OracleDriver");
        Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "c##ankush", "ankush");
        Statement stm = connection.createStatement();

        
        if( text.stripLeading().toLowerCase().startsWith("select") ){ 
            ResultSet rs = stm.executeQuery(text);
            ResultSetMetaData rsmd = rs.getMetaData();
            int columnCount = rsmd.getColumnCount();
            
            out.println("<table class='table'><thead><tr>");

            String[] colNames = new String[columnCount];
            
            for (int i = 1; i <= columnCount; i++ ) {
                colNames[i - 1] = rsmd.getColumnName(i);
                out.println(String.format("<th scope=\"col\">%s</th>", 
                    colNames[i - 1]) 
                );
            }
            
            out.println("</tr></thead><tbody>");
            
            while( rs.next() ){
                out.println("<tr>");
                
                for(int i = 1; i <= columnCount; i++){
                    out.println(
                        "<td>" + rs.getObject(i) + "</td>"
                    );
                }
                out.println("</tr>");
            }
            
            out.println("</tbody></table>");
        }else{
            int updates = stm.executeUpdate(text);
            
            out.println(
                String.format("<div>%d rows affected.</div>", updates)
            );
        }

        
        connection.close();
    }catch(Exception e){
        e.printStackTrace(new java.io.PrintWriter(out));
    }
    out.println("<script> alert(\"Executed sucessfully.\");"
            + " setTimeout(function (){"
            + "     window.location = 'index.html';"
            + "}, 10000); "
            + "</script>");
%>

</body>
</html>