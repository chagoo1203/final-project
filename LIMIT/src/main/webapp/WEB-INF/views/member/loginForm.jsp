<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>
</head>
<body>
	<form method="post" action="loginForm.me">
		<table id="table" align="center">
		<tr><td><input type="text" name="userId" id="logId" required placeholder=" 아이디"></td></tr>
		<tr><td><input type="password" name="userPwd" id="userPwd" required placeholder=" 비밀번호"></td></tr>
		</table>
		<div align="center">
			<button type="submit" class="btn btn-sm btn-info">작성하기</button>
			<button type="reset" class="btn btn-sm btn-danger">되돌리기</button>
		</div>
	</form>
</body>
</html>