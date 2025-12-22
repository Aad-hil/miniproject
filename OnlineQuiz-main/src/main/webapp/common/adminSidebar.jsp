<%@ page contentType="text/html; charset=UTF-8" %>
<%
    String activeMenu = (String) request.getAttribute("activeMenu");
    if (activeMenu == null) activeMenu = "";
%>

<style>
/* =========================
   RETRO TERMINAL SIDEBAR
========================= */
:root {
    --sidebar-bg: #000;
    --sidebar-border: #0f0;
    --text: #0f0;
    --muted: #090;
    --accent: #0f0;
    --hover: #030;
}

/* MENU TRIGGER */
.menu-trigger {
    position: fixed;
    top: 82px;
    left: 20px;
    font-size: 26px;
    cursor: pointer;
    z-index: 1200;
    color: var(--text);
    font-family: "Courier New", monospace;
    transition: transform 0.3s ease, opacity 0.3s ease;
}

.menu-trigger.hidden {
    opacity: 0;
    pointer-events: none;
    transform: rotate(90deg);
}

/* SIDEBAR */
.sidebar {
    position: fixed;
    top: 70px;
    left: 0;
    height: calc(100vh - 70px);
    width: 0;
    background: var(--sidebar-bg);
    border-right: 2px dashed var(--sidebar-border);
    overflow: hidden;
    transition: width 0.35s ease;
    z-index: 1100;
    padding-top: 80px;
    font-family: "Courier New", monospace;
}

.sidebar.open {
    width: 260px;
}

/* CLOSE BUTTON */
.close-btn {
    position: absolute;
    top: 18px;
    right: 20px;
    font-size: 28px;
    cursor: pointer;
    color: var(--text);
    transition: transform 0.3s ease;
}

.close-btn:hover {
    transform: rotate(90deg);
}

/* MENU ITEMS */
.menu-item > a {
    display: flex;
    align-items: center;
    gap: 10px;
    padding: 12px 20px;
    color: var(--text);
    font-size: 14px;
    text-decoration: none;
    transition: background 0.25s ease, color 0.25s ease;
    white-space: nowrap;
    border-left: 2px solid transparent;
}

.menu-item > a:hover {
    background: var(--hover);
    color: #0f0;
}

/* ACTIVE MENU */
.menu-item.active > a {
    background: #030;
    color: var(--accent);
    font-weight: bold;
    border-left: 3px solid var(--accent);
}

/* ICONS */
.menu-icon {
    font-size: 16px;
}

/* SUB MENU */
.sub-menu {
    display: none;
    background: #111;
}

.sub-menu a {
    padding: 10px 40px;
    font-size: 13px;
    color: var(--muted);
    display: block;
    text-decoration: none;
    transition: background 0.25s;
}

.sub-menu a:hover {
    background: var(--hover);
    color: var(--text);
}

/* SUBMENU ANIMATION */
.sub-menu.show {
    display: block;
    animation: slideDown 0.25s ease;
}

@keyframes slideDown {
    from { opacity: 0; transform: translateY(-6px); }
    to { opacity: 1; transform: translateY(0); }
}
</style>

<!-- ☰ MENU TRIGGER -->
<div id="menuTrigger" class="menu-trigger" onclick="openMenu()">☰</div>

<!-- SIDEBAR -->
<div id="sidebar" class="sidebar">

    <span class="close-btn" onclick="closeMenu()">×</span>

    <!-- Dashboard -->
    <div class="menu-item <%= "dashboard".equals(activeMenu) ? "active" : "" %>">
        <a href="<%=request.getContextPath()%>/admin/dashboard">
            <span class="menu-icon">📊</span> Dashboard
        </a>
    </div>

    <!-- Quiz Manager -->
    <div class="menu-item <%= "quiz".equals(activeMenu) ? "active" : "" %>">
        <a href="javascript:void(0)" onclick="toggleSubMenu('quizSub')">
            <span class="menu-icon">🧠</span> Quiz Manager
        </a>
        <div id="quizSub" class="sub-menu <%= "quiz".equals(activeMenu) ? "show" : "" %>">
            <a href="<%=request.getContextPath()%>/admin/quiz-list">📄 Quiz List</a>
            <a href="<%=request.getContextPath()%>/admin/createQuiz.jsp">➕ Create Quiz</a>
        </div>
    </div>

    <!-- Question Manager -->
    <div class="menu-item <%= "question".equals(activeMenu) ? "active" : "" %>">
        <a href="javascript:void(0)" onclick="toggleSubMenu('questionSub')">
            <span class="menu-icon">❓</span> Question Manager
        </a>
        <div id="questionSub" class="sub-menu <%= "question".equals(activeMenu) ? "show" : "" %>">
            <a href="<%=request.getContextPath()%>/admin/AddQuestion.jsp">➕ Add Questions</a>
            <a href="<%=request.getContextPath()%>/QuestionListServlet">📋 Question List</a>
        </div>
    </div>

    <!-- Leaderboard -->
    <div class="menu-item <%= "leaderboard".equals(activeMenu) ? "active" : "" %>">
        <a href="<%=request.getContextPath()%>/admin/leaderboard.jsp">
            <span class="menu-icon">🏆</span> Leaderboard
        </a>
    </div>

</div>

<script>
function openMenu() {
    document.getElementById("sidebar").classList.add("open");
    document.getElementById("menuTrigger").classList.add("hidden");
}

function closeMenu() {
    document.getElementById("sidebar").classList.remove("open");
    setTimeout(() => {
        document.getElementById("menuTrigger").classList.remove("hidden");
    }, 300);
}

function toggleSubMenu(id) {
    document.getElementById(id).classList.toggle("show");
}
</script>
