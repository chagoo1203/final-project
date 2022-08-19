<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
<style>
.outer{
    width: 800px;
    margin-left: 35%;
    margin-top: 15px;
}
.title {
    font-size: xx-large;
    font-weight: bold;
}
</style>
</head>
<body>
	
	<jsp:include page="../../common/menubar.jsp" />
	<jsp:include page="../adminMenu.jsp" />
	
	<div class="outer">
        <p class="title" align="center">회원 상세 조회</p>     
        <hr>
        <br>
        
        <label>USER ID : </label>
        <input type="text" readonly class="form-control" value="${m.userId}">
        <br>
        <label>USER NAME : </label>
        <input type="text" readonly class="form-control" value="${m.userName}">
        <br>
        <label>NICKNAME :  </label>
        <input type="text" readonly class="form-control" value="${m.nickName}">
        <br>
        <label>EAMIL :  </label>
        <input type="text" readonly class="form-control" value="${m.email}">
        <br>
        <label>GENDER : </label>
        <c:choose>
        	<c:when test="${m.gender eq 'F'}">
		        <input type="text" readonly class="form-control" value="여성">
        	</c:when>
        	<c:otherwise>
		        <input type="text" readonly class="form-control" value="남성">
        	</c:otherwise>
        </c:choose>
        <br>
        <label>BIRTH DATE : </label>
        <input type="text" readonly class="form-control" value="${m.birthDate}">
        <br>
        <label>PHONE : </label>
        <input type="text" readonly class="form-control" value="${m.phone}">
        <br>
        <label>ADDRESS :  </label>
        <input type="text" readonly class="form-control" value="${m.address}">
        <br>
        <label>가입일 :  </label>
        <input type="text" readonly class="form-control" value="${m.enrollDate}">
        <br>
        <label>가입 상태 :  </label>
        <c:choose>
        	<c:when test="${m.status eq 'Y'}">
		        <input type="text" readonly class="form-control" value="회원 ">
        	</c:when>
        	<c:otherwise>
		        <input type="text" readonly class="form-control" value="탈퇴회원 ">
        	</c:otherwise>
        </c:choose>
        <br>

        <a class="btn btn-secondary" href="member.ad">목록보기</a>
        <c:choose>
        	<c:when test="${m.status eq 'Y'}">
		        <a href="delete.ad?userId=${m.userId}" class="btn btn-warning" style="float: right;">회원탈퇴</a>
        	</c:when>
        	<c:otherwise>
		        <a href="restore.ad?userId=${m.userId}" class="btn btn-warning" style="float: right;">회원복구</a>
        	</c:otherwise>
        </c:choose>

    </div>
    
    <br><br><br><br clear="both">
	<jsp:include page="../../common/footer.jsp" />

</body>
</html>