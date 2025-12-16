<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>직원 목록</title>
    <style>
        /* 전체 공통 */
body {
    font-family: 'Segoe UI', sans-serif;
    background-color: #fffceb;
    padding: 40px;
}

h1 {
    text-align: center;
    color: #4a90e2;
    font-size: 28px;
    margin-bottom: 30px;
}

/* 1) rowPerPage 전용 */
.rowper-form {
    display: flex;
    justify-content: flex-end;
    align-items: center;
    margin-bottom: 10px;
    gap: 8px;
}

.rowper-form label {
    font-size: 14px;
    color: #555;
}

.rowper-form select {
    padding: 6px 10px;
    border: 1px solid #ddd;
    border-radius: 6px;
    font-size: 14px;
    background-color: #fff;
    box-shadow: 1px 1px 3px rgba(0,0,0,0.05);
    appearance: none;
    background-image: url('data:image/svg+xml;utf8,<svg fill="black" height="12" viewBox="0 0 24 24" width="12" xmlns="http://www.w3.org/2000/svg"><path d="M7 10l5 5 5-5z"/></svg>');
    background-repeat: no-repeat;
    background-position: right 10px center;
    background-size: 12px;
}

/* 2) searchWord 검색 영역 전용 */
.search-form {
    display: flex;
    justify-content: flex-end;
    align-items: center;
    margin-bottom: 20px;
    gap: 8px;
}

.search-form input[type="text"] {
    padding: 6px 10px;
    border: 1px solid #ddd;
    border-radius: 6px;
    font-size: 14px;
}

.search-form button {
    padding: 6px 14px;
    border-radius: 6px;
    border: none;
    background-color: #4a90e2;
    color: #fff;
    font-size: 14px;
    cursor: pointer;
}

.search-form button:hover {
    opacity: 0.9;
}

/* 3) 페이지 네비게이션 전용 */
.page-nav {
    margin-top: 16px;
    text-align: center;
}

.page-nav a {
    margin: 0 6px;
    text-decoration: none;
    color: #4a90e2;
    font-weight: bold;
}

.page-nav span {
    margin: 0 6px;
    color: #999;
}

/* 테이블 관련 CSS는 기존 그대로 사용하시면 됩니다 */
table {
    width: 100%;
    border-collapse: collapse;
    background-color: #ffffff;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.06);
}

th, td {
    padding: 14px;
    text-align: center;
    border-bottom: 1px solid #f3f3f3;
}

th {
    background-color: #fff3a3;
    color: #333;
    font-size: 15px;
}

tr:hover {
    background-color: #f5faff;
}

td {
    font-size: 14px;
}

.no-data {
    text-align: center;
    padding: 20px;
    color: #999;
}

    </style>
</head>
<body>

<h1>👩‍💼 직원 목록</h1>

<!-- rowPerPage 영역 -->
<form action="/empList" method="get" class="rowper-form">
    <label for="rowPerPage">rowPerPage:</label>
    <select name="rowPerPage" id="rowPerPage" onchange="this.form.submit()">
        <option value="10" ${param.rowPerPage == '10' || empty param.rowPerPage ? 'selected="selected"' : ''}>10</option>
        <option value="20" ${param.rowPerPage == '20' ? 'selected="selected"' : ''}>20</option>
        <option value="30" ${param.rowPerPage == '30' ? 'selected="selected"' : ''}>30</option>
    </select>
    <!-- 검색어 유지용 hidden -->
    <input type="hidden" name="searchWord" value="${param.searchWord}">
</form>

<!-- searchWord 검색 영역 -->
<form action="/empList" method="get" class="search-form">
    <!-- rowPerPage 유지용 hidden -->
    <input type="hidden" name="rowPerPage" value="${empty param.rowPerPage ? 10 : param.rowPerPage}">
    id검색 :
    <input type="text" name="searchWord" value="${param.searchWord}">
    <button type="submit">검색</button>
</form>

<!-- 직원 리스트 -->
<c:choose>
    <c:when test="${not empty list}">
        <table>
            <tr>
                <th>사원번호</th>
                <th>아이디</th>
                <th>비밀번호</th> <!-- findAll() 사용 시 원치 않는 컬럼까지 올 수 있음 -->
                <th>부서번호</th>
            </tr>
            <c:forEach var="e" items="${list}">
                <tr>
                    <td>${e.empno}</td>
                    <td>${e.id}</td>
                    <td>${e.pw}</td>
                    <td>${e.deptno}</td>
                </tr>
            </c:forEach>
        </table>
    </c:when>
    <c:otherwise>
        <div class="no-data">직원 정보가 없습니다.</div>
    </c:otherwise>
</c:choose>

<!-- pageNavigation 영역 -->
<div class="page-nav">
    <c:if test="${currentPage > 0}">
        <a href="/empList?currentPage=${currentPage-1}
                         &rowPerPage=${empty param.rowPerPage ? 10 : param.rowPerPage}
                         &searchWord=${param.searchWord}">[이전]</a>
    </c:if>

    <span>${currentPage + 1} / ${lastPage + 1}</span>

    <c:if test="${currentPage < lastPage}">
        <a href="/empList?currentPage=${currentPage+1}
                         &rowPerPage=${empty param.rowPerPage ? 10 : param.rowPerPage}
                         &searchWord=${param.searchWord}">[다음]</a>
    </c:if>
</div>

</body>
</html>
