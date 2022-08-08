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
	<jsp:include page="../common/menubar.jsp" />
	<form method="post" action="loginForm.me">
		<table id="table" align="center">
			<tr><td><input type="text" name="userId" id="logId" required placeholder=" 아이디"></td></tr>
			<tr><td><input type="password" name="userPwd" id="userPwd" required placeholder=" 비밀번호"></td></tr>
		</table>
		<div align="center">
			<button type="submit" class="btn btn-sm btn-info">작성하기</button>
			<a href="enrollForm.me" class="btn btn-sm btn-warning">회원가입</a>
			<div class="logSave">
				<input type="checkbox" name="saveId" id="saveId" style="width:30px; height:15px; margin-left:70px;">
				<label for="saveId" style="font-size:15px;">아이디 저장</label>
			</div>
		</div>
	</form>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>