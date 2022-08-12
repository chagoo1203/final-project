<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
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
.innerOuter {
    width:80%;
    margin:auto;
    background-color:white;
}
</style>
</head>
<body>

	<jsp:include page="../../common/menubar.jsp" />
	<jsp:include page="../adminMenu.jsp" />
	
	<div class="outer">
        <p class="title" align="center">공지사항 등록</p> 
        <hr>
        <br>

        <div class="innerOuter">
            <form id="enrollForm" method="post" action="insert.no">
                <input type="hidden" name="noticeType" value="N">
                <table algin="center">
                    <tr>
                        <td><input type="text" id="title" class="form-control" name="" placeholder="제목을 입력해 주세요" style="width: 630px;" required></td>
                    </tr>
                    <tr>
                        <td><textarea id="content" class="form-control" rows="10" style="resize:none;" name="" placeholder="내용을 입력해 주세요" required></textarea></td>
                    </tr>
                </table>
                <br>
                <div align="right">
                    <button type="reset" class="btn btn-secondary">취소하기</button>
                    <button type="submit" class="btn btn-dark">등록하기</button>
                </div>
            </form>
        </div>
        
    </div>
	
	<br><br>
	<jsp:include page="../../common/footer.jsp" />

</body>
</html>