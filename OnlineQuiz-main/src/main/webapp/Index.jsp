<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setAttribute("pageContext", "index");
%>
<jsp:include page="/common/navbar.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Online Quiz Portal</title>

<style>
/* =========================
   NEW THEME – RETRO TERMINAL
========================= */
body {
    margin: 0;
    min-height: 100vh;
    font-family: "Courier New", monospace;
    background: #111;
    color: #0f0;
    display: grid;
    place-items: center;
}

/* Outer wrapper */
.portal-card {
    border: 3px solid #0f0;
    padding: 20px;
    width: 100%;
    max-width: 800px;
    text-align: left;
    background: #000;
}

/* Heading */
.portal-card h1 {
    font-size: 28px;
    font-weight: bold;
    text-transform: uppercase;
    border-bottom: 2px dashed #0f0;
    padding-bottom: 10px;
    margin-bottom: 20px;
}

/* Cards container */
.card-container {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 15px;
}

/* Individual card */
.role-card {
    background: #111;
    border: 2px solid #0f0;
    padding: 15px;
    cursor: pointer;
    transition: background 0.3s ease, color 0.3s ease;
}

.role-card:hover {
    background: #0f0;
    color: #000;
}

/* SVG icons */
.role-card svg {
    width: 40px;
    height: 40px;
    margin-bottom: 10px;
    stroke: currentColor;
}

/* Title */
.role-card h2 {
    font-size: 18px;
    margin: 5px 0;
}

/* Subtitle */
.role-card p {
    font-size: 12px;
    opacity: 0.8;
}

/* Footer */
.footer {
    margin-top: 25px;
    font-size: 11px;
    text-align: center;
    border-top: 1px solid #0f0;
    padding-top: 10px;
}

/* Mobile */
@media (max-width: 600px) {
    .card-container {
        grid-template-columns: 1fr;
    }
}
</style>
</head>

<body>

<div class="portal-card">

    <h1>Online Quiz Portal</h1>

    <div class="card-container">

        <!-- ADMIN CARD -->
        <div class="role-card"
             onclick="window.location.href='<%=request.getContextPath()%>/admin/AdminLogin.jsp'">

            <svg viewBox="0 0 24 24" fill="none">
                <path d="M12 3L4 6v6c0 5 3.5 8.5 8 9 4.5-.5 8-4 8-9V6l-8-3Z"
                      stroke-width="2"/>
                <path d="M9 12l2 2 4-4"
                      stroke-width="2"/>
            </svg>

            <h2>Admin</h2>
            <p>Manage quizzes, questions & results</p>
        </div>

        <!-- USER CARD -->
        <div class="role-card"
             onclick="window.location.href='<%=request.getContextPath()%>/User/User.jsp'">

            <svg viewBox="0 0 24 24" fill="none">
                <circle cx="12" cy="8" r="4"
                        stroke-width="2"/>
                <path d="M4 20c0-4 4-6 8-6s8 2 8 6"
                      stroke-width="2"/>
            </svg>

            <h2>User</h2>
            <p>Attempt quizzes & view leaderboard</p>
        </div>

    </div>

    <div class="footer">
        © My Quiz Portal
    </div>

</div>

</body>
</html>
