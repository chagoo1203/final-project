<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<style>
	#p-5{
		align: center;
    	border : solid 1px black;
		width : 400px;
		height : 320px;
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
	#atagPw > a{
		align : right;
		text-decoration: none;
 	 	color : red;
 	 	padding-right : 10px;
	}
	


</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />

 	<script type="text/javascript">



	var msg = "${msg}";
		 
		if (msg != "") {
			alert(msg);
		}


	</script>
 	<div id="p-5">
 		<header>
			<h2>PW 찾기</h2>
		</header><br>
	    <div class="text-center">
	        <h1 class="h4 text-gray-900 mb-2">비밀번호 찾기</h1>
	        <p class="mb-4">아이디와 이메일을 입력해주세요!</p>
	    <form class="user" action="pwResult.me" method="post">
	       <div class="form-group">
	            <input type="text" 
	                id="userId" name="userId"
	                placeholder="아이디를 입력해주세요">
	        </div>
	        <div class="form-group">
	            <input type="email"
	                id="email" name="email"
	                placeholder="이메일을 입력해주세요">
	        </div>
	         
	        <button type="submit" class="btn-dark">
	           		비밀번호 찾기
	        </button><br>
	        <div id="atagPw">
	      		 <a href="login.me">Login</a>
	      		 <a class="small" href="${pageContext.request.contextPath}" >메인페이지</a>
	        </div>
	    </form>
	    </div>

   </div>
     	<jsp:include page="../common/footer.jsp" />
     
</body>
</html>