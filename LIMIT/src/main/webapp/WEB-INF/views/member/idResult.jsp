<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 결과물</title>
<style>
	#container{
		align: center;
    	border : solid 1px black;
		width : 400px;
		height : 300px;
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
	#idSuccess{
		padding-left : 100px;
        display: inline-block;
        text-align: center;	
	}
	.found-id{
		font-size: 50px;
	
	}
	#idmain{
	 text-decoration: none;
 	 color : red;
 	 padding-right : 10px;
 	 
 	}
	
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />

	<div id = "container">
		<header>
			<h2>아이디 찾기 성공!</h2>
		</header><br>
		<div class = "found-success">
			<div id="idSuccess">
			<h4>회원님의 아이디는</h4>
		   		<div class ="found-id">${idFindList.userId}</div>
		    <h4>입니다 </h4>
			</div>
	    </div>
	    <div class = "found-login" align="right">
 		  	<a href="${pageContext.request.contextPath}" id="idmain">메인화면으로</a>
       	</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
	
</body>
</html>