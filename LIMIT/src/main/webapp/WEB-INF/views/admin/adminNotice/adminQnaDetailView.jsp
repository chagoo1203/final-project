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
        <p class="title" align="center">Q&A 상세 페이지</p> 
        <hr>
        <br>

        <div class="innerOuter">
            <form id="updateForm" method="post" action="update.qna">
            	<input type="hidden" name="noticeNo" value="${n.noticeNo}">
                <table algin="center">
                    <tr>
                        <td><input type="text" id="title" class="form-control" name="noticeTitle" value="${n.noticeTitle}" required></td>
                    </tr>
                    <tr>
                        <td><textarea id="content" class="form-control" style="width: 640px" rows="10" style="resize:none;" name="noticeContent" required>${n.noticeContent}</textarea></td>
                    </tr>
                </table>
                <br>
                <div align="right">
                    <a href="delete.qna?qno=${n.noticeNo}" class="btn btn-warning">삭제하기</a>
                    <button type="reset" class="btn btn-secondary">이전으로</button>
                    <button type="submit" class="btn btn-dark">수정하기</button>
                </div>
            </form>
        </div>
    </div>
    
    
    <br><br>
	<jsp:include page="../../common/footer.jsp" />

</body>
</html>