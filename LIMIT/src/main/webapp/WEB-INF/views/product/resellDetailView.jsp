<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LIMIT</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
	.resellImg{
		width : 600px;
		height : 600px;
	}
	.resellInfo{
		border-left : thick solid black;
		height : 100%;
		position : absolute;
	}

</style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp" />
	
	<div class="resellImg">이미지</div>
	
	<div class="resellInfo">상품 정보</div>
	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>