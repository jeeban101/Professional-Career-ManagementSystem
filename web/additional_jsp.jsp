<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Job Portal</title>
</head>
<body>
    <h1>Job Portal</h1>

    <%-- Account Creation --%>
    <%@ page import="java.util.HashMap" %>
    <%@ page import="java.util.Map" %>
    <%
        Map<String, String> accounts = (Map<String, String>) application.getAttribute("accounts");
        if (accounts == null) {
            accounts = new HashMap<>();
            application.setAttribute("accounts", accounts);
        }

        if (request.getMethod().equals("POST")) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            // Validation: Check if username already exists
            if (accounts.containsKey(username)) {
                out.println("<p>Username already exists. Please choose a different username.</p>");
            } else {
                // Perform account creation logic here (e.g., store the account in a database)
                accounts.put(username, password);
                out.println("<p>Account created successfully!</p>");
            }
        }
    %>

    <%-- Account Creation Form --%>
    <h2>Create Account</h2>
    <form method="post">
        Username: <input type="text" name="username" required><br>
        Password: <input type="password" name="password" required><br>
        <input type="submit" value="Create Account">
    </form>

    <%-- Job Selection and Actions --%>
    <%@ page import="java.util.ArrayList" %>
    <%
        ArrayList<String> availableJobs = new ArrayList<>();
        availableJobs.add("Software Engineer");
        availableJobs.add("Data Analyst");
        availableJobs.add("Marketing Specialist");

        String selectedJob = request.getParameter("job");
        String selectedAction = request.getParameter("action");
        String user = request.getParameter("username");

        if (selectedJob != null && selectedAction != null && user != null) {
            if (selectedAction.equals("apply")) {
                // Validation: Check if the user exists
                if (accounts.containsKey(user)) {
                    // Perform the job application logic here (e.g., store the application in a database)
                    out.println("<p>" + user + " applied for " + selectedJob + " job.</p>");
                } else {
                    out.println("<p>Account not found. Please create an account to apply for jobs.</p>");
                }
            } else if (selectedAction.equals("decline")) {
                // Validation: Check if the user exists
                if (accounts.containsKey(user)) {
                    // Perform the job application decline logic here (e.g., update database status)
                    out.println("<p>" + user + " declined " + selectedJob + " job.</p>");
                } else {
                    out.println("<p>Account not found. Please create an account to decline jobs.</p>");
                }
            }
        }
    %>

    <%-- Job Selection Form --%>
    <h2>Select Job</h2>
    <form method="post">
        <input type="hidden" name="username" value="<%= user %>">
        <select name="job">
            <% for (String job : availableJobs) { %>
                <option value="<%= job %>"><%= job %></option>
            <% } %>
        </select>
        <input type="submit" name="action" value="apply">
        <input type="submit" name="action" value="decline">
    </form>

    <%-- Job Details --%>
    <%
        if (request.getParameter("jobDetails") != null) {
            String job = request.getParameter("jobDetails");
            // Fetch job details from a database or data source based on the job parameter
            // For simplicity, we will use dummy job details
            String jobDescription = "This is a sample job description for " + job + ".";
            out.println("<h2>Job Details: " + job + "</h2>");
            out.println("<p>" + jobDescription + "</p>");
        }
    %>

    <%-- User Profile --%>
    <%@ page import="java.util.HashMap" %>
    <%
        if (request.getParameter("profile") != null) {
            String user = request.getParameter("profile");
            // Fetch user profile details from a database or data source based on the username
            // For simplicity, we will use dummy user profile details
            String userEmail = user + "@example.com";
            out.println("<h2>User Profile: " + user + "</h2>");
            out.println("<p>Email: " + userEmail + "</p>");
        }
    %>

</body>
</html>
