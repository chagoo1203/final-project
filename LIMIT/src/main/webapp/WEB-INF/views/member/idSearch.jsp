<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#idRap{
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
	#idin{
		padding-left : 80px;
        display: inline-block;
        text-align: center;		
	}
</style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp" />
	<div id="idRap">
		<header>
			<h2>ID 찾기</h2>
		</header><br>
	<form name="idfindscreen" method = "post" id="idin">
			<div class = "search-title">
				<h3>휴대폰 본인확인</h3>
			</div><br>
		<section class = "form-search">
			<div class = "find-name">
				<label>이름</label>
				<input type="text" name="member_name" class = "btn-name" placeholder = "등록한 이름">
			<br>
			</div>
			<div class = "find-phone">
				<label>번호</label>
				<input type="text" name="member_phone" class = "btn-phone" placeholder = "휴대폰번호를 '-'를 포함하여 입력">
			</div>
			<br>
	</section>
	<div class ="btnSearch" align="center">
		<input type="button" name="enter" value="찾기" class="btn-primary" onClick="id_search()">
		<input type="button" name="cancle" value="취소" class="btn-dark" onClick="history.back()">
 	</div>
 </form>
	</div>
 
 	<jsp:include page="../common/footer.jsp" />
 
 <script>
 	function id_search() { 
	 	var regExpPhone2 = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
	 	const $memberPhone = $('.find-phone input[name=member_phone]');
	 	const $memberName = $('.find-name input[name=member_name]');
	 	if ($memberName.val().legnth < 1 || !regExpPhone2.test($memberPhone.val())) {
		  alert("잘못 입력하셨습니다.");
		  return;
		}else{
			$('input[name=enter]').attr('type','submit');
			$('form[name=idfindscreen]').attr('action', 'findIdResult.me');
		}

	 
	 }
 
 </script>
</body>
</html>