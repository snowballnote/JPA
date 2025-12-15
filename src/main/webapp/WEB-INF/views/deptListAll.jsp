<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서 목록</title>

<style>
    /* 전체 배경 */
    body {
        font-family: 'Segoe UI', 'Apple SD Gothic Neo', sans-serif;
        background-color: #fefce8; /* 따뜻한 옐로우 */
        margin: 0;
        padding: 40px;
        color: #444;
    }

    /* 제목 */
    h1 {
        text-align: center;
        color: #4f8cc9; /* 파스텔 블루 */
        margin-bottom: 30px;
        font-size: 32px;
    }

    /* 상단 버튼 영역 */
    .top-area {
        display: flex;
        justify-content: flex-end;
        margin-bottom: 20px;
    }

    .add-btn {
        background-color: #ffe066; /* 옐로우 */
        color: #333;
        padding: 10px 18px;
        border-radius: 999px;
        text-decoration: none;
        font-weight: bold;
        box-shadow: 0 4px 8px rgba(255, 224, 102, 0.4);
        transition: transform 0.2s, box-shadow 0.2s;
    }

    .add-btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 6px 12px rgba(255, 224, 102, 0.6);
    }

    /* 테이블 */
    table {
        width: 100%;
        border-collapse: separate;
        border-spacing: 0 14px;
    }

    th {
        background-color: #d0ebff; /* 연한 블루 */
        color: #1864ab;
        padding: 14px;
        font-size: 15px;
        border-radius: 10px 10px 0 0;
    }

    td {
        background-color: #fffdf4; /* 따뜻한 베이지 */
        padding: 16px;
        text-align: center;
        border-radius: 16px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
        font-size: 14px;
    }

    /* 버튼 묶음 */
    .btn-wrap {
        display: flex;
        justify-content: center;
        gap: 8px;
    }

    .btn {
        padding: 8px 14px;
        border-radius: 999px;
        font-size: 13px;
        font-weight: bold;
        text-decoration: none;
        color: white;
        transition: transform 0.15s;
    }

    .btn:hover {
        transform: scale(1.05);
    }

    .modify {
        background-color: #74c0fc; /* 파스텔 블루 */
    }

    .delete {
        background-color: #f783ac; /* 파스텔 핑크 */
    }

    /* hover row */
    tr:hover td {
        background-color: #fffbe6;
    }

</style>

</head>
<body>

    <h1>🌼 부서 목록 🌼</h1>

    <div class="top-area">
        <a href="/addDept" class="add-btn">＋ 부서 추가</a>
    </div>

    <table>
        <thead>
            <tr>
                <th>부서번호</th>
                <th>부서명</th>
                <th>위치</th>
                <th>생성일</th>
                <th>관리</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="d" items="${list}">
                <tr>
                    <td>${d.deptno}</td>
                    <td>${d.name}</td>
                    <td>${d.loc}</td>
                    <td>${d.createdAt}</td>
                    <td>
                        <div class="btn-wrap">
                            <a class="btn modify" href="/modifyDept?deptno=${d.deptno}">수정</a>
                            <a class="btn delete" href="/removeDept?deptno=${d.deptno}">삭제</a>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

</body>
</html>
