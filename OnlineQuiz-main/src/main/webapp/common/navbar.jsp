<%@ page contentType="text/html; charset=UTF-8" %>

<%
    Object adminObj = session.getAttribute("admin");
    Object userObj  = session.getAttribute("user");
%>

<style>
/* =========================
   RETRO TERMINAL STYLE
========================= */
body {
    --bg-page: #111;
    --bg-navbar: #000;
    --text-main: #0f0;
    --primary: #0f0;
    --bg-hover: #030;

    margin: 0;
    padding-top: 60px;
    background: var(--bg-page);
    color: var(--text-main);
    font-family: "Courier New", monospace;
}

/* NAVBAR */
.navbar {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 60px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: var(--bg-navbar);
    border-bottom: 2px dashed var(--primary);
    padding: 0 20px;
    box-sizing: border-box;
    z-index: 2000;
}

.navbar .logo {
    font-size: 20px;
    font-weight: bold;
    color: var(--primary);
    text-transform: uppercase;
    letter-spacing: 2px;
}

.navbar .nav-links {
    display: flex;
    align-items: center;
    gap: 12px;
}

.navbar a {
    color: var(--text-main);
    text-decoration: none;
    font-weight: bold;
    padding: 6px 12px;
    border: 1px solid var(--primary);
    background: #000;
    transition: background 0.2s ease, color 0.2s ease;
}

.navbar a:hover {
    background-color: var(--primary);
    color: #000;
}
</style>

<div class="navbar">
    <div class="logo">ONLINE QUIZ</div>

    <div class="nav-links">
        <% if (adminObj == null && userObj == null) { %>
            <a href="<%=request.getContextPath()%>/Index.jsp">Home</a>
            <a href="<%=request.getContextPath()%>/admin/AdminLogin.jsp">Admin Login</a>
            <a href="<%=request.getContextPath()%>/User/User.jsp">User Login</a>
        <% } else if (adminObj != null) { %>
            <a href="<%=request.getContextPath()%>/admin/dashboard">Dashboard</a>
            <a href="<%=request.getContextPath()%>/LogoutServlet">Logout</a>
        <% } else if (userObj != null) { %>
            <a href="<%=request.getContextPath()%>/User/UserDashboard.jsp">Dashboard</a>
            <a href="<%=request.getContextPath()%>/User/Leaderboard.jsp">Leaderboard</a>
            <a href="<%=request.getContextPath()%>/LogoutServlet">Logout</a>
        <% } %>
    </div>
</div>
