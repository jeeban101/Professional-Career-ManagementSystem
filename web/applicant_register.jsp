<%@page import="java.sql.*"%>
<%
    try{

        String citizenship = request.getParameter("rCitizenshipNo");
        String user_id = request.getParameter("rUserId");
        String name = request.getParameter("rApplicantName");
        String address = request.getParameter("rApplicantAddr");
        Integer experience = Integer.parseInt(request.getParameter("rExperience"));
        String dob = request.getParameter("rDOB");
        Integer age = Integer.parseInt(request.getParameter("rAge"));
        String education = request.getParameter("rEducation");

        java.sql.Date DOB = java.sql.Date.valueOf(dob);

        Class.forName("oracle.jdbc.OracleDriver");

        Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","c##ankush", "ankush");

        PreparedStatement pstm = connection.prepareStatement(
                "insert into applicant values(?, ?, ? ,? ,? ,? ,? ,?)"
        );

        pstm.setInt(1, Integer.parseInt(citizenship));
        pstm.setString(2, user_id);
        pstm.setString(3, name);
        pstm.setString(4, address);
        pstm.setInt(5,experience);
        pstm.setDate(6, DOB);
        pstm.setInt(7,age);
        pstm.setString(8,education);

        pstm.executeUpdate();

        out.println("<script> alert(\"User added sucessfully.\");"
                + " window.location = 'index.html'; </script>");
    } catch(Exception e){
        e.printStackTrace(new java.io.PrintWriter(out));
    }
       
%>