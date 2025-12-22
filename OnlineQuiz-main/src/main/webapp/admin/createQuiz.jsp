<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.quiz.dao.QuizDAO" %>
<%
    request.setAttribute("pageContext", "admin");
    request.setAttribute("activeMenu", "quiz");

    QuizDAO dao = new QuizDAO();
    List<String> categories = dao.getAllCategories();
%>

<jsp:include page="/common/navbar.jsp"/>
<jsp:include page="/common/adminSidebar.jsp"/>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Create Quiz</title>

<style>
/* =========================
   RETRO TERMINAL STYLE
========================= */
body {
    margin: 0;
    padding-top: 70px;
    font-family: "Courier New", monospace;
    background: #000;
    color: #0f0;
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}

.container {
    background: #111;
    border: 2px dashed #0f0;
    padding: 30px;
    width: 420px;
    text-align: left;
    box-shadow: 0 0 15px #0f0;
}

h2 {
    font-size: 20px;
    font-weight: bold;
    margin-bottom: 20px;
    text-transform: uppercase;
    border-bottom: 2px solid #0f0;
    padding-bottom: 6px;
}

label {
    display: block;
    font-weight: bold;
    margin-top: 12px;
    margin-bottom: 4px;
    color: #0f0;
}

input[type="text"], select {
    width: 100%;
    padding: 10px;
    border: 2px solid #0f0;
    background: #000;
    color: #0f0;
    font-size: 14px;
    margin-bottom: 15px;
    outline: none;
}

input::placeholder {
    color: #090;
}

input:focus, select:focus {
    background: #030;
    border-color: #0f0;
}

button {
    margin-top: 15px;
    width: 100%;
    padding: 12px;
    font-size: 14px;
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

.footer {
    margin-top: 15px;
    font-size: 12px;
    color: #090;
    text-align: center;
    border-top: 1px dashed #0f0;
    padding-top: 8px;
}
</style>
</head>

<body>
    <div class="container">
        <h2>New Quiz</h2>
        <form action="../CreateQuizServlet" method="post">
            <label for="title">Title</label>
            <input type="text" id="title" name="title" placeholder="Quiz name" required>

            <label for="category">Category</label>
            <select id="category" name="category" required>
                <option value="" disabled selected>Select...</option>
                <%
                    for(String cat : categories) {
                %>
                    <option value="<%=cat%>"><%=cat%></option>
                <%
                    }
                %>
            </select>

            <button type="submit">Save Quiz</button>
        </form>
        <div class="footer">© Quiz Portal</div>
    </div>
</body>
</html>
