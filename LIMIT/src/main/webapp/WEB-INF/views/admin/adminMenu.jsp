<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    border: 1px solid red;
	float: left;
    width: 240px;
	font-size: 20px;
	margin-top: 50px;
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
				<a href="">상품 관리</a>
			</label>
		</div>
			
		<div class="accordion">
			<input type="checkbox" id="answer02" /> <label for="answer02">회원 관리<img
				alt=""
				src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKKs6OP36GlHnJCLBRA3bwO1RYfLy9VLUesg&usqp=CAU"></label>
			<div>
				<a href=""> - 회원 조회</a>
				<br /> <a href=""> - 회원 탈퇴 / 복구</a>
			</div>
		</div>
		<div class="accordion">
			<input type="checkbox" id="answer03" /> <label for="answer03">매출 관리</label>
		</div>
		<div class="accordion">
			<input type="checkbox" id="answer04" /> <label for="answer04">고객센터<img
				alt=""
				src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKKs6OP36GlHnJCLBRA3bwO1RYfLy9VLUesg&usqp=CAU"></label>
			<div>
				<a href="adminQna.qna"> - Q&A 관리</a> <br /> <a
					href=""> - 공지사항 관리</a>
			</div>
		</div>
	</div>

</body>
</html>