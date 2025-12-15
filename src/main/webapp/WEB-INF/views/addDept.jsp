<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서 추가</title>
<style>
    body {
        font-family: 'Segoe UI', sans-serif;
        background-color: #fefce8;
        padding: 40px;
    }

    h1 {
        text-align: center;
        color: #4f8cc9;
        font-size: 28px;
        margin-bottom: 30px;
    }

    form {
        background-color: #fffef3;
        width: 400px;
        margin: 0 auto;
        padding: 25px;
        border-radius: 14px;
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.05);
        border: 1px solid #ffe066;
    }

    table {
        width: 100%;
        border-collapse: collapse;
    }

    td {
        padding: 12px;
    }

    input[type="text"] {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 8px;
        background-color: #ffffff;
    }

    button {
        width: 100%;
        padding: 12px;
        background-color: #ffe066;
        color: #333;
        font-size: 15px;
        font-weight: bold;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        transition: background-color 0.2s;
    }

    button:hover {
        background-color: #ffd43b;
    }
</style>
</head>
<body>

    <h1>➕ 부서 추가</h1>

    <form action="/addDept" method="post">
        <table>
            <tr>
                <td>부서명</td>
                <td><input type="text" name="name" required></td>
            </tr>
            <tr>
                <td>위치</td>
                <td><input type="text" name="loc" required></td>
            </tr>
        </table>
        <button type="submit">추가하기</button>
    </form>

</body>
</html>
