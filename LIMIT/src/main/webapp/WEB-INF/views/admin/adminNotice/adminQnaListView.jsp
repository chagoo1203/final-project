<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
</head>
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
.table {
    text-align: center;
    width: 650px;
}

.table a {
    color: black;
}

.table th {
    color: #495057;
    background-color: #e9ecef;
}

.select {width:20%;}
.text {width:53%;}
.searchBtn {width:20%;}
.btn{
    float: right;
    margin-right: 10%;
    margin-bottom: 10px;
}
thead{
    background-color: rgb(220, 218, 218);
}

</style>

<body>
	
	<jsp:include page="../../common/menubar.jsp" />
	<jsp:include page="../adminMenu.jsp" />
	
	<div class="outer">
        <p class="title" align="center">Q&A 관리</p>     
        <hr>
        <br>
        <div id="btn">
            <a class="btn btn-secondary" href="enrollForm.qna">글작성</a>
        </div>
        <br>
        <table class="table" align="center" id="qnaList">
            <thead>
            <tr>
                <th>글번호</th>
                <th>글제목</th>
                <th>조회수</th>
                <th>작성일</th>
            </tr>
            </thead>
            <tbody>
                <c:forEach var="n" items="${list}">
                	<tr>
                		<td>${n.noticeNo}</td>
                		<td>${n.noticeTitle}</td>
                		<td>${n.noticeCount}</td>
                		<td>${n.createDate}</td>
                	</tr>
                </c:forEach>
            </tbody>
        </table>
        <br>
        
        <script>
         	$(function(){
         		$("#qnaList>tbody>tr").click(function(){
         			// 클릭될때마다 url 요청 
         			var qno = $(this).children().eq(0).text();
         			
         			location.href = "detail.qna?qno="+ qno;
         		})
         	});
          </script>
        

		<!-- 페이징 처리 -->
        <br><br><br>
        <div class="container">                  
            <ul class="pagination justify-content-center pagination-sm">
            <!-- previous 페이지 버튼 -->
            <c:choose>
           		<c:when test="${pi.currentPage eq 1}">
               		<li class="page-item disabled"><a class="page-link bg-secondary text-white" href="#">Previous</a></li>
               	</c:when>
               	<c:otherwise>
               		<li class="page-item"><a class="page-link bg-secondary text-white" href="list.qna?page=${pi.currentPage - 1}">Previous</a></li>                    	
               	</c:otherwise>
            </c:choose>
            
            <!-- 숫자가 나오는 페이지 버튼 -->
            <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
            	<li class="page-item"><a class="page-link bg-secondary text-white" href="list.qna?page=${p}">${p}</a></li>
            </c:forEach>
            
            <!-- next 페이지 버튼 -->
            <c:choose>
            	<c:when test="${pi.currentPage eq pi.maxPage}">
              <li class="page-item disabled"><a class="page-link bg-secondary text-white" href="#">Next</a></li>
            	</c:when>
            	<c:otherwise>
              <li class="page-item"><a class="page-link bg-secondary text-white" href="list.qna?page=${pi.currentPage + 1}">Next</a></li>
            	</c:otherwise>
            </c:choose>
            </ul>
        </div>
    </div>
	
	
	<br><br>
	<jsp:include page="../../common/footer.jsp" />

</body>
</html>