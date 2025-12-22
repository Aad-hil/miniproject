<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.quiz.model.Admin" %>

<%
    request.setAttribute("pageContext", "admin");
    request.setAttribute("activeMenu", "dashboard");

    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("AdminLogin.jsp");
        return;
    }
%>

<jsp:include page="/common/navbar.jsp"/>
<jsp:include page="/common/adminSidebar.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>

<style>
/* =========================
   RETRO SHORTCUT DASHBOARD
========================= */
body {
    margin: 0;
    padding-top: 70px;
    background: #000;
    font-family: "Courier New", monospace;
    color: #0f0;
}

.dashboard-content {
    padding: 30px;
    margin-left: 260px;
}

.welcome {
    font-size: 22px;
    font-weight: bold;
    margin-bottom: 10px;
    text-transform: uppercase;
    border-bottom: 2px dashed #0f0;
    padding-bottom: 6px;
}

.subtitle {
    font-size: 13px;
    color: #090;
    margin-bottom: 25px;
}

/* Shortcut grid */
.shortcut-container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
    gap: 20px;
    max-width: 900px;
}

.shortcut-card {
    background: #111;
    border: 2px solid #0f0;
    padding: 20px;
    text-align: center;
    cursor: pointer;
    transition: transform 0.25s ease, box-shadow 0.25s ease;
}

.shortcut-card:hover {
    transform: scale(1.05);
    box-shadow: 0 0 20px #0f0;
}

.shortcut-card svg {
    width: 40px;
    height: 40px;
    margin-bottom: 12px;
    stroke: #0f0;
}

.shortcut-card h3 {
    font-size: 14px;
    text-transform: uppercase;
    margin: 0;
    color: #0f0;
}
</style>
</head>

<body>

<div class="dashboard-content">

    <div class="welcome">
        Greetings, <%= admin.getUsername() %>
    </div>

    <div class="subtitle">
        Quick access to admin tools
    </div>

    <div class="shortcut-container">

        <!-- QUIZ MANAGER -->
        <div class="shortcut-card" onclick="window.location.href='<%=request.getContextPath()%>/admin/quiz-list'">
            <svg viewBox="0 0 24 24" fill="none">
                <path d="M4 5h16M4 10h16M4 15h10" stroke-width="2"/>
            </svg>
            <h3>Quiz Manager</h3>
        </div>

        <!-- QUESTION MANAGER -->
        <div class="shortcut-card" onclick="window.location.href='<%=request.getContextPath()%>/QuestionListServlet'">
            <svg viewBox="0 0 24 24" fill="none">
                <path d="M12 17h.01M9 9a3 3 0 116 0c0 2-3 2-3 4" stroke-width="2"/>
            </svg>
            <h3>Question Manager</h3>
        </div>

        <!-- LEADERBOARD -->
        <div class="shortcut-card" onclick="window.location.href='<%=request.getContextPath()%>/admin/leaderboard.jsp'">
            <svg viewBox="0 0 24 24" fill="none">
                <path d="M16 21v-2a4 4 0 00-4-4H6a4 4 0 00-4 4v2" stroke-width="2"/>
                <circle cx="9" cy="7" r="4" stroke-width="2"/>
            </svg>
            <h3>Leaderboard</h3>
        </div>

    </div>

</div>

</body>
</html>
