<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>직원 목록</title>
    <style>
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

        form {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            margin-bottom: 20px;
        }

        label {
            font-size: 14px;
            margin-right: 8px;
            color: #555;
        }

        select {
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

    <form action="/empList" method="get">
        <label for="rowPerPage">rowPerPage:</label>
        <select name="rowPerPage" id="rowPerPage" onchange="this.form.submit()">
            <option value="10" ${param.rowPerPage == '10' ? 'selected' : ''}>10</option>
            <option value="20" ${param.rowPerPage == '20' ? 'selected' : ''}>20</option>
            <option value="30" ${param.rowPerPage == '30' ? 'selected' : ''}>30</option>
        </select>
    </form>

    <c:choose>
        <c:when test="${not empty list}">
            <table>
                <tr>
                    <th>사원번호</th>
                    <th>아이디</th>
                    <th>부서번호</th>
                </tr>
                <c:forEach var="e" items="${list}">
                    <tr>
                        <td>${e.empno}</td>
                        <td>${e.id}</td>
                        <td>${e.deptno}</td>
                    </tr>
                </c:forEach>
            </table>
        </c:when>
        <c:otherwise>
            <div class="no-data">직원 정보가 없습니다.</div>
        </c:otherwise>
    </c:choose>

</body>
</html>
