<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setAttribute("pageContext", "admin");
    request.setAttribute("activeMenu", "question");
    String theme = (String) session.getAttribute("theme");
    if (theme == null) theme = "light";
%>
<body data-theme="<%= theme %>">

<jsp:include page="/common/navbar.jsp"/>
<jsp:include page="/common/adminSidebar.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Question</title>
<style>
/* Retro neon theme */
body {
    margin: 0;
    padding-top: 70px;
    font-family: "Courier New", monospace;
    background: #000;
    color: #0f0;
}

main.content {
    max-width: 650px;
    margin: 40px auto;
    padding: 20px;
    border: 2px dashed #0f0;
    background: #111;
    box-shadow: 0 0 15px #0f0;
}

h2.page-title {
    text-align: center;
    font-size: 22px;
    text-transform: uppercase;
    border-bottom: 2px dashed #0f0;
    padding-bottom: 6px;
    margin-bottom: 20px;
}

/* Form styling */
form {
    display: flex;
    flex-direction: column;
}

label {
    font-weight: bold;
    margin-top: 12px;
    color: #0f0;
}

input[type="text"],
textarea,
select {
    width: 100%;
    padding: 8px;
    margin-top: 6px;
    border: 1px dashed #0f0;
    background: #000;
    color: #0f0;
    font-size: 13px;
    outline: none;
}

textarea {
    resize: none;
}

/* Submit button */
input[type="submit"] {
    margin-top: 15px;
    width: 100%;
    padding: 10px;
    background: #0f0;
    border: 2px solid #0f0;
    color: #000;
    font-weight: bold;
    cursor: pointer;
    text-transform: uppercase;
}

input[type="submit"]:hover {
    background: #090;
    color: #0f0;
}

/* Messages */
.message {
    text-align: center;
    font-weight: bold;
    margin-bottom: 15px;
}

.success { color: #4ade80; }
.error { color: #f87171; }

/* Back link */
a.back-link {
    display: block;
    text-align: center;
    margin-top: 20px;
    color: #0f0;
    text-decoration: none;
    font-weight: bold;
}

a.back-link:hover {
    text-decoration: underline;
}
</style>
</head>

<body>
<main class="content">
  <h2 class="page-title">Create Question</h2>

  <%
      String success = request.getParameter("success");
      String error = request.getParameter("error");
      if (success != null) {
  %>
    <p class="message success"><%= success %></p>
  <% } else if (error != null) { %>
    <p class="message error"><%= error %></p>
  <% } %>

  <form action="/OnlineQuiz/AddQuestionServlet" method="post">
    <label>Subject:</label>
    <select name="category" required>
      <option value="">--Choose Subject--</option>
      <option value="Java">Java</option>
      <option value="Python">Python</option>
      <option value="Web Development">Web Development</option>
      <option value="Databases">Databases</option>
      <option value="Networking">Networking</option>
    </select>

    <label>Enter Question:</label>
    <textarea name="questionText" rows="3" placeholder="Type your question..." required></textarea>

    <label>Choice A:</label>
    <input type="text" name="optionA" placeholder="Choice A" required>

    <label>Choice B:</label>
    <input type="text" name="optionB" placeholder="Choice B" required>

    <label>Choice C:</label>
    <input type="text" name="optionC" placeholder="Choice C" required>

    <label>Choice D:</label>
    <input type="text" name="optionD" placeholder="Choice D" required>

    <label>Right Answer:</label>
    <select name="correctOption" required>
      <option value="">--Select Answer--</option>
      <option value="A">Choice A</option>
      <option value="B">Choice B</option>
      <option value="C">Choice C</option>
      <option value="D">Choice D</option>
    </select>

    <input type="submit" value="Save Question">
  </form>

  <a href="<%=request.getContextPath()%>/admin/dashboard" class="back-link">
    ⬅ Return to Dashboard
  </a>
</main>
</body>
</html>
