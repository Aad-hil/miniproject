<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setAttribute("pageContext", "admin");
%>
<jsp:include page="/common/navbar.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>

<style>
/* =========================
   RETRO TERMINAL BASE
========================= */
body {
    margin: 0;
    min-height: 100vh;
    font-family: "Courier New", monospace;
    background: #000;
    color: #0f0;
    display: flex;
    justify-content: center;
    align-items: center;
}

/* =========================
   LOGIN PANEL
========================= */
.login-card {
    width: 460px;
    padding: 30px;
    border: 3px dashed #0f0;
    background: #111;
    text-align: left;
    animation: flicker 1.2s infinite alternate;
}

@keyframes flicker {
    from { box-shadow: 0 0 5px #0f0; }
    to   { box-shadow: 0 0 20px #0f0; }
}

/* =========================
   ICON
========================= */
.login-card svg {
    width: 60px;
    height: 60px;
    margin-bottom: 15px;
    stroke: #0f0;
}

/* =========================
   HEADING
========================= */
.login-card h2 {
    font-size: 22px;
    font-weight: bold;
    margin-bottom: 20px;
    text-transform: uppercase;
    border-bottom: 2px solid #0f0;
    padding-bottom: 8px;
}

/* =========================
   FORM
========================= */
form {
    margin-top: 20px;
}

label {
    font-size: 13px;
    font-weight: bold;
    margin-bottom: 4px;
    display: block;
    color: #0f0;
}

input {
    width: 100%;
    padding: 10px;
    margin-bottom: 18px;
    border: 2px solid #0f0;
    background: #000;
    color: #0f0;
    font-size: 14px;
    outline: none;
}

input::placeholder {
    color: #090;
}

input:focus {
    background: #030;
    border-color: #0f0;
}

/* =========================
   BUTTON
========================= */
button {
    width: 100%;
    padding: 12px;
    font-size: 15px;
    font-weight: bold;
    color: #000;
    background: #0f0;
    border: 2px solid #0f0;
    cursor: pointer;
    text-transform: uppercase;
}

button:hover {
    background: #090;
    color: #0f0;
}

/* =========================
   ERROR
========================= */
.error {
    background: #300;
    color: #f66;
    padding: 8px;
    border: 2px solid #f00;
    margin-bottom: 15px;
    text-align: center;
    font-size: 13px;
}

/* =========================
   FOOTER
========================= */
.footer {
    margin-top: 20px;
    font-size: 12px;
    color: #090;
    text-align: center;
    border-top: 1px dashed #0f0;
    padding-top: 8px;
}
</style>
</head>

<body>

<div class="login-card">

    <!-- ADMIN SVG -->
    <svg viewBox="0 0 24 24" fill="none">
        <path d="M12 3L4 6v6c0 5 3.5 8.5 8 9 4.5-.5 8-4 8-9V6l-8-3Z"
              stroke-width="2"/>
        <path d="M9 12l2 2 4-4"
              stroke-width="2"/>
    </svg>

    <h2>Admin Login</h2>

    <%
        String error = (String) request.getAttribute("error");
        if (error != null) {
    %>
        <div class="error"><%= error %></div>
    <% } %>

    <form action="<%=request.getContextPath()%>/Admin/AdminLoginServlet" method="post">
        <label for="username">Username</label>
        <input type="text" id="username" name="username"
               placeholder="Enter your username" required>

        <label for="password">Password</label>
        <input type="password" id="password" name="password"
               placeholder="Enter your password" required>

        <button type="submit">Login</button>
    </form>

    

</div>

</body>
</html>
