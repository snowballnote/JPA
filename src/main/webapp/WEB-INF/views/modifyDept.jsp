<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서 수정</title>
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
        width: 420px;
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

    input[readonly] {
        background-color: #f4f4f4;
        color: #666;
    }

    button {
        width: 100%;
        padding: 12px;
        background-color: #74c0fc;
        color: white;
        font-size: 15px;
        font-weight: bold;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        transition: background-color 0.2s;
    }

    button:hover {
        background-color: #4dabf7;
    }
</style>
</head>
<body>

    <h1>✏️ 부서 정보 수정</h1>

    <form action="/modifyDept" method="post">
        <table>
            <tr>
                <td>부서번호</td>
                <td><input type="text" name="deptno" value="${dept.deptno}" readonly></td>
            </tr>
            <tr>
                <td>부서명</td>
                <td><input type="text" name="name" value="${dept.name}" required></td>
            </tr>
            <tr>
                <td>위치</td>
                <td><input type="text" name="loc" value="${dept.loc}" required></td>
            </tr>
        </table>
        <button type="submit">수정하기</button>
    </form>

</body>
</html>
