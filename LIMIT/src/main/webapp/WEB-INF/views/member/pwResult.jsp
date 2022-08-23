<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 발급 성공페이지</title>
<style>
	#jumbotron{
		align: center;
    	border : solid 1px black;
		width : 400px;
		height : 350px;
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
	#pwSuccess{

        display: inline-block;
        text-align: center;	
	}
	#pwButton > a{
		 text-decoration: none;
	 	 color : red;
	 	 padding-right : 10px;
	}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />

  <div id="jumbotron" align="center">
  		<header>
			<h2>비밀번호 발급 성공!</h2>
		</header><br>
		<div id="pwSuccess">
 		    <h2> 임시 비밀번호가 전송되었습니다. </h2><br/>
  		
		  	<h3>${memberEmail}</h3><br/>
		  	<h2>를 확인해주세요.</h2>
		    <div id = "pwButton" align="right">
			    <a href="login.me">로그인페이지</a>
			    <a href="${pageContext.request.contextPath}">메인페이지</a>
			</div>
		</div>
  </div>
  	<jsp:include page="../common/footer.jsp" />
  
</body>
</html>