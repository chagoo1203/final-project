<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디비번찾기</title>
<style>
	#idpwRap{
		align: center;
    	border : solid 1px black;
		width : 400px;
		height : 150px;
		margin : auto;
		margin-top : 50px;
		border-radius : 6px;
	}
	header{
		background-color:lightgray;
		height : 50px;
		text-align: center;
	  	padding-top : 5px;
	}
	#idpw{
		text-align: center;
	}

</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div id="idpwRap">
		<header>
			<h2>ID / PW 찾기</h2>
		</header><br>
		<div id="idpw"> 
			<a href="idFind.me" id="idfind" name="idfind" class="btn btn-dark">아이디 찾기</a>
			<a href="pwFind.me" id="pwfind" name="pwfind" class="btn btn-dark">비밀번호 찾기</a>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
	
</body>
</html>