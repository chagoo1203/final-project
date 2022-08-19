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

#searchForm {
            width:80%;
            margin:auto;
        }
#searchForm>* {
    float:left;
    margin:5px;
}
.select {width:20%;}
.text {width:53%;}
.searchBtn {width:20%;}
.btn{
    float: right;
    margin-right: 10%;
}
thead{
    background-color: rgb(220, 218, 218);
}
</style>
</head>
<body>

	<jsp:include page="../../common/menubar.jsp" />
	<jsp:include page="../adminMenu.jsp" />
	
	<div class="outer">
        <p class="title" align="center">탈퇴 회원 조회</p>     
        <hr>
        <br>
        <form id="searchForm" action="searchDeletedMem.ad" method="get" align="center">
            <div class="select" id="search-area">
                <select class="custom-select" name="condition">
                    <option value="userId">아이디</option>
                    <option value="userName">회원명</option>
                    <option value="nickName">닉네임</option>
                </select>
            </div>
            <div class="text">
                <input type="text" class="form-control" id="keyword" name="keyword" value="${keyword}">
            </div>
            <button type="submit" class="searchBtn btn btn-secondary">검색</button>
        </form>
        
        <c:if test="${ not empty condition }">
        <script>
        	$(function(){
        		$("#search-area option[value=${condition}]").attr("selected", true);
        	});
        </script>
		</c:if>
		
		<c:if test="${not empty keyword}">
		<script>
		$(function(){
    		$("#keyword").val("${keyword}");
    	});
		</script>
		</c:if>
        
        <table class="table" align="center">
            <thead>
            <tr>
                <th>아이디</th>
                <th>회원명</th>
                <th>닉네임</th>
                <th>회원가입일</th>
                <th>회원탈퇴일</th>
                <th>회원복구</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="m" items="${list}">
                	<tr>
                		<td>${m.userId}</td>
                		<td>${m.userName}</td>
                		<td>${m.nickName}</td>
                		<td>${m.enrollDate}</td>
                		<td>${m.modifyDate}</td>
                		<td><a class="btn btn-secondary" href="restore.ad?userId=${m.userId}">회원복구</a></td>
                	</tr>
                </c:forEach>
            </tbody>
        </table>
        <br>
        
        <br><br>
        <!-- 페이징 처리 -->
        <br><br>
        <div class="container">                  
            <ul class="pagination justify-content-center pagination-sm">
            <!-- previous 페이지 버튼 -->
            <c:choose>
           		<c:when test="${pi.currentPage eq 1}">
               		<li class="page-item disabled"><a class="page-link bg-secondary text-white" href="#">Previous</a></li>
               	</c:when>
               	<c:when test="${not empty condition and not empty keyword}">
               		<li class="page-item"><a class="page-link bg-secondary text-white" href="searchDeletedMem.ad?condition=${condition}&keyword=${keyword}&page=${pi.currentPage - 1}">Previous</a></li>
               	</c:when>
               	<c:otherwise>
               		<li class="page-item"><a class="page-link bg-secondary text-white" href="deletedMember.ad?page=${pi.currentPage - 1}">Previous</a></li>                    	
               	</c:otherwise>
            </c:choose>
            
            <!-- 숫자가 나오는 페이지 버튼 -->
            <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
            	<c:choose>
            		<c:when test="${not empty condition and not empty keyword}">
		            	<li class="page-item"><a class="page-link bg-secondary text-white" href="searchDeletedMem.ad?condition=${condition}&keyword=${keyword}&page=${p}">${p}</a></li>
            		</c:when>
            		<c:otherwise>
		            	<li class="page-item"><a class="page-link bg-secondary text-white" href="deletedMember.ad?page=${p}">${p}</a></li>
            		</c:otherwise>
            	</c:choose>
            </c:forEach>
            
            <!-- next 페이지 버튼 -->
            <c:choose>
            	<c:when test="${pi.currentPage eq pi.maxPage}">
              <li class="page-item disabled"><a class="page-link bg-secondary text-white" href="#">Next</a></li>
            	</c:when>
            	<c:when test="${not empty keyword and not empty keyword}">
	              <li class="page-item"><a class="page-link bg-secondary text-white" href="searchDeletedMem.ad?condition=${condition}&keyword=${keyword}&page=${pi.currentPage + 1}">Next</a></li>
            	</c:when>
            	<c:otherwise>
              	<li class="page-item"><a class="page-link bg-secondary text-white" href="deletedMember.ad?page=${pi.currentPage + 1}">Next</a></li>
            	</c:otherwise>
            </c:choose>
            </ul>
        </div>
         
    </div>
    
    <br><br>
	<jsp:include page="../../common/footer.jsp" />

</body>
</html>