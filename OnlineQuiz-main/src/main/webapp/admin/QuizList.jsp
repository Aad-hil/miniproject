<%@ page import="java.util.List, com.quiz.model.Quiz, com.quiz.model.Question" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    request.setAttribute("pageContext", "admin");
    request.setAttribute("activeMenu", "quiz");

    List<Quiz> quizzes = (List<Quiz>) request.getAttribute("quizzes");
    int currentPage = (int) request.getAttribute("currentPage");
    int totalPages = (int) request.getAttribute("totalPages");
%>

<jsp:include page="/common/navbar.jsp"/>
<jsp:include page="/common/adminSidebar.jsp"/>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Quiz List</title>
<style>
body {
    margin: 0;
    padding-top: 70px;
    font-family: "Courier New", monospace;
    background: #000;
    color: #0f0;
}

h2 {
    text-align: center;
    margin: 20px 0;
    font-size: 22px;
    text-transform: uppercase;
    border-bottom: 2px dashed #0f0;
    padding-bottom: 6px;
}

/* Quiz Card */
.quiz-card {
    max-width: 800px;
    margin: 15px auto;
    background: #111;
    border: 2px solid #0f0;
    padding: 20px;
    box-shadow: 0 0 15px #0f0;
    transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.quiz-card:hover {
    transform: scale(1.02);
    box-shadow: 0 0 25px #0f0;
}

.quiz-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    cursor: pointer;
}

.quiz-title {
    font-size: 16px;
    font-weight: bold;
    color: #0f0;
}

.quiz-category {
    font-size: 13px;
    color: #090;
    text-transform: uppercase;
}

/* Question section hidden by default */
.question-section {
    display: none;
    margin-top: 10px;
}

/* Question cards */
.question-card {
    background: #000;
    border: 1px dashed #0f0;
    margin: 8px 0;
    padding: 10px;
    cursor: pointer;
}

.question-card:hover {
    background: #030;
}

/* Question content hidden by default */
.question-content {
    display: none;
    margin-top: 6px;
    padding-left: 10px;
    font-size: 13px;
}

/* Pagination */
.pager {
    text-align: center;
    margin: 20px 0;
}

.pager a, .pager span {
    padding: 6px 12px;
    margin: 0 4px;
    text-decoration: none;
    font-weight: bold;
    border: 2px solid #0f0;
    color: #0f0;
    background: #000;
}

.pager span {
    background: #0f0;
    color: #000;
}
</style>
</head>
<body>

<h2>Quiz List</h2>

<%
int index = (currentPage - 1) * 5 + 1;
for (Quiz quiz : quizzes) {
%>
<div class="quiz-card">
    <div class="quiz-header" onclick="toggleQuestions('<%=quiz.getId()%>')">
        <div class="quiz-title"><%= index++ %>. <%= quiz.getQuizName() %></div>
        <div class="quiz-category"><%= quiz.getCategory() %></div>
    </div>

    <div id="q<%=quiz.getId()%>" class="question-section">
        <%
        int qNum = 1;
        for (Question q : quiz.getQuestions()) {
        %>
        <div class="question-card" onclick="toggleQuestionContent(this)">
            <strong>Q<%=qNum++%>:</strong> <%= q.getQuestionText() %>
            <div class="question-content">
                <p>A: <%= q.getOptionA() %></p>
                <p>B: <%= q.getOptionB() %></p>
                <p>C: <%= q.getOptionC() %></p>
                <p>D: <%= q.getOptionD() %></p>
                <p><strong>Answer: <%= q.getCorrectOption() %></strong></p>
            </div>
        </div>
        <% } %>
    </div>
</div>
<% } %>

<!-- Pagination -->
<div class="pager">
<% for (int i = 1; i <= totalPages; i++) { %>
    <% if (i == currentPage) { %>
        <span><%= i %></span>
    <% } else { %>
        <a href="<%=request.getContextPath()%>/admin/quiz-list?page=<%=i%>"><%= i %></a>
    <% } %>
<% } %>
</div>

<script>
function toggleQuestions(id) {
    const el = document.getElementById("q" + id);
    el.style.display = (el.style.display === "block") ? "none" : "block";
}

function toggleQuestionContent(card) {
    const content = card.querySelector('.question-content');
    content.style.display = (content.style.display === "block") ? "none" : "block";
}
</script>

</body>
</html>
