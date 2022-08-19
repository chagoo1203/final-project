<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="../common/menubar.jsp" />
	<form name="idfindscreen" method = "post">
			<div class = "search-title">
				<h3>휴대폰 본인확인</h3>
			</div>
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
	<div class ="btnSearch">
		<input type="button" name="enter" value="찾기"  onClick="id_search()">
		<input type="button" name="cancle" value="취소" onClick="history.back()">
 	</div>
 </form>
 
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