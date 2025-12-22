<%@ page import="java.util.List, com.quiz.model.Question" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    request.setAttribute("pageContext", "admin");
    request.setAttribute("activeMenu", "question");

    List<Question> questionList = (List<Question>) request.getAttribute("questionList");
%>

<jsp:include page="/common/navbar.jsp"/>
<jsp:include page="/common/adminSidebar.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Questions</title>
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
}

/* Heading */
h2 {
    text-align: center;
    color: #0f0;
    margin: 20px 0;
    text-transform: uppercase;
    border-bottom: 2px dashed #0f0;
    padding-bottom: 6px;
}

/* Table container */
.table-container {
    max-width: 1100px;
    margin: 0 auto 40px;
    overflow-x: auto;
    background: #111;
    border: 2px solid #0f0;
    padding: 15px;
    box-shadow: 0 0 15px #0f0;
}

/* Table styling */
.question-table {
    width: 100%;
    border-collapse: collapse;
    color: #0f0;
}

.question-table th, .question-table td {
    padding: 10px;
    text-align: left;
    border-bottom: 1px dashed #0f0;
}

.question-table th {
    background: #030;
    font-weight: bold;
    text-transform: uppercase;
}

.question-row {
    cursor: pointer;
}

.question-row:hover {
    background-color: #030;
}

/* Hidden details */
.details {
    display: none;
    background: #000;
    color: #0f0;
}

.details td {
    padding: 8px 10px;
    border-bottom: 1px dashed #0f0;
    font-size: 13px;
}

/* Pager */
.pager {
    text-align: center;
    margin: 15px 0;
    font-size: 13px;
    color: #090;
}
</style>
</head>
<body>

<h2>Questions List</h2>

<div class="table-container">
    <table class="question-table">
        <thead>
            <tr>
                <th>Category</th>
                <th>Text</th>
            </tr>
        </thead>
        <tbody>
            <%
                if(questionList != null && !questionList.isEmpty()) {
                    for(Question q : questionList) {
            %>
            <!-- Clickable row -->
            <tr class="question-row" onclick="toggleDetails('q<%=q.getId()%>')">
                <td><%= q.getCategory() %></td>
                <td><%= q.getQuestionText() %></td>
            </tr>
            <!-- Hidden details -->
            <tr id="q<%=q.getId()%>" class="details">
                <td colspan="2">
                    A: <%= q.getOptionA() %><br>
                    B: <%= q.getOptionB() %><br>
                    C: <%= q.getOptionC() %><br>
                    D: <%= q.getOptionD() %><br>
                    <strong>Answer: <%= q.getCorrectOption() %></strong>
                </td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="2" style="text-align:center;">No entries available</td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>

<div class="pager">
    Showing all available questions
</div>

<script>
function toggleDetails(id) {
    const el = document.getElementById(id);
    el.style.display = (el.style.display === "table-row") ? "none" : "table-row";
}
</script>

</body>
</html>
