<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<body>
 	<script type="text/javascript">



	var msg = "${msg}";
		 
		if (msg != "") {
			alert(msg);
		}


	</script>
 	<div class="p-5">
	    <div class="text-center">
	        <h1 class="h4 text-gray-900 mb-2">비밀번호 찾기</h1>
	        <p class="mb-4">아이디와 이메일을 입력해주세요!</p>
	    </div>
	    <form class="user" action="pwResult.me" method="post">
	       <div class="form-group">
	            <input type="text" class="form-control form-control-user"
	                id="userId" name="userId"
	                placeholder="아이디를 입력해주세요">
	        </div>
	        <div class="form-group">
	            <input type="email" class="form-control form-control-user"
	                id="email" name="email"
	                placeholder="이메일을 입력해주세요">
	        </div>
	         
	        <button type="submit" class="btn btn-primary btn-user btn-block">
	           		비밀번호 찾기
	        </button>
	    </form>
	    <hr>
	     <a href="login.me" class="btn btn-google btn-user btn-block">
	           Login
	        </a>
	        <hr>
	       <div class="text-center">
	        <a class="small" href="${pageContext.request.contextPath}">메인페이지</a>
           </div>
     </div>
</body>
</html>