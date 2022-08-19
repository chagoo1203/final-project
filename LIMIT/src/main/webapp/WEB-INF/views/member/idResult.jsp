<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 결과물</title>
</head>
<body>
	<div class = "container">
		<div class = "found-success">
			<h4>  회원님의 아이디는 </h4>  
	        <div class ="found-id">${idFindList.userId}</div>
	        <h4>  입니다 </h4>
	    </div>
	    <div class = "found-login">
 		  	<a href="${pageContext.request.contextPath}">메인화면으로</a>
       	</div>
	</div>
</body>
</html>