<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Log Out</title>
</head>
<body>
    <%
    HttpSession usersession = request.getSession();
    usersession.invalidate();
    out.println("<h1> Logout_ Page 🏴 󠁧󠁢󠁥󠁮󠁧󠁿</h1>");
    %>
    
    <button onClick="index()"> 🌼 메인화면 🌼 </button>
</body>
<script>
	const index = () => {
	    location.href = "/";
	}
</script>
</html>