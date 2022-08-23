<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<title>관리자페이지</title>
</head>
<style>
.adminMenu a {
	color: black
}

input[id*="answer"] {
	display: none;
}

input[id*="answer"]+label {
	display: block;
	cursor: pointer;
	position: relative;
	color: black
}

input[id*="answer"]+label+div {
	max-height: 0;
	transition: all 0.5s;
	overflow: hidden;
}

input[id*="answer"]:checked+label+div {
	max-height: 120px;
}

input[id*="answer"]+label img {
	position: absolute;
	top: 50%;
	right: 10px;
	width: 20px;
	height: 20px;
	margin-top: -10px;
	display: inline-block;
	background: 0 0 no-repeat;
}

input[id*="answer"]:checked+label img {
	background-position: 0 -30px;
}

.adminMenu {
	float: left;
    width: 240px;
	font-size: 20px;
	margin-left: 20%;
	margin-top: 15px;
}

.adminMenu label:hover {
	font-size: 26px;
	color: gray
}

.adminMenu a:hover {
	font-size: 26px;
	color: gray
}

.adminMenu div {
	margin-bottom: 25px;
	margin-top: 25px;
}

.title {
	font-size: xx-large;
	font-weight: bold;
}

a {
	text-decoration: none !important;
}
</style>
<body>

	<div class="adminMenu">
		<p class="title">관리자 페이지</p>
		<hr>
		<div class="accordion">
			<input type="checkbox" id="answer01" /> <label for="answer01">
				<a href="admin.ad">상품 관리</a>
			</label>
		</div>
			
		<div class="accordion">
			<input type="checkbox" id="answer02" /> <label for="answer02">회원 관리<img
				alt=""
				src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKKs6OP36GlHnJCLBRA3bwO1RYfLy9VLUesg&usqp=CAU"></label>
			<div>
				<a href="member.ad"> - 회원 조회</a>
				<br /> <a href="deletedMember.ad"> - 회원 탈퇴 / 복구</a>
			</div>
		</div>
		<div class="accordion">
			<input type="checkbox" id="answer03" /> <label for="answer03">
			<a href="paymentForm.rs">매출 관리</a>
			</label>
		</div>
		<div class="accordion">
			<input type="checkbox" id="answer03" /> <label for="answer03">
			<a href="delivery.ad">배송 관리</a>
			</label>
		</div>
		<div class="accordion">
			<input type="checkbox" id="answer04" /> <label for="answer04">고객센터<img
				alt=""
				src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKKs6OP36GlHnJCLBRA3bwO1RYfLy9VLUesg&usqp=CAU"></label>
			<div>
				<a href="list.qna"> - Q&A 관리</a> <br /> <a
					href="list.no"> - 공지사항 관리</a>
			</div>
		</div>
	</div>

</body>
</html>