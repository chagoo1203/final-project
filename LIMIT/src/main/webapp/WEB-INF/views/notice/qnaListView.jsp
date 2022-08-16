<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
</head>
<style>
.outer{
    margin-left: 35%;
    width: 800px;
    margin-top: 15px;
}
.title {
    font-size: xx-large;
    font-weight: bold;
}
.table {
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
}
</style>
<body>

	<jsp:include page="../common/menubar.jsp" />
	<jsp:include page="noticeMenu.jsp" />
	
	<div class="outer">
        <p class="title">Q&A</p>     
        <hr>
        <br>
        <div class="container">
        	<table class="table" id="qnaList">
        		<tbody>
        			<c:forEach var="n" items="${list}">
		                <tr>
		                  <input type="hidden" name="noticeNo" value="${n.noticeNo}">
		                  <td>${n.noticeTitle}</td>
		                </tr>
        			</c:forEach>
              </tbody>
            </table>
          </div>
        <br>
        
        
        <!-- Q&A 리스트 클릭시 Q&A 상세 페이지로 이동할수 있는 스크립트 -->
        <script>
         	$(function(){
         		$("#qnaList>tbody>tr").click(function(){
         			// 클릭될때마다 url 요청 
         			var qno = $(this).children().eq(0).val();
         			
         			location.href = "detail.cqa?qno="+ qno;
         		})
         	});
         </script>


		<!-- 페이징 처리 하는 곳 / 아직 못 만듬 -->
        <br><br><br>
        <div class="container">                  
            <ul class="pagination justify-content-center pagination-sm">
            <!-- previous 페이지 버튼 -->
            <c:choose>
           		<c:when test="${pi.currentPage eq 1}">
               		<li class="page-item disabled"><a class="page-link bg-secondary text-white" href="#">Previous</a></li>
               	</c:when>
               	<c:otherwise>
               		<li class="page-item"><a class="page-link bg-secondary text-white" href="customer.ct?qpage=${pi.currentPage - 1}">Previous</a></li>                    	
               	</c:otherwise>
            </c:choose>
            
            <!-- 숫자가 나오는 페이지 버튼 -->
            <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
            	<li class="page-item"><a class="page-link bg-secondary text-white" href="customer.ct?qpage=${p}">${p}</a></li>
            </c:forEach>
            
            <!-- next 페이지 버튼 -->
            <c:choose>
            	<c:when test="${pi.currentPage eq pi.maxPage}">
              <li class="page-item disabled"><a class="page-link bg-secondary text-white" href="#">Next</a></li>
            	</c:when>
            	<c:otherwise>
              <li class="page-item"><a class="page-link bg-secondary text-white" href="customer.ct?qpage=${pi.currentPage + 1}">Next</a></li>
            	</c:otherwise>
            </c:choose>
            </ul>
        </div>
         
    </div>
	
	
	

	
	<br><br>
	<jsp:include page="../common/footer.jsp" />
	
</body>
</html>