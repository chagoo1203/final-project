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
.table tbody>tr:hover{
	cursor : pointer;
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
        <p class="title" align="center">배송 관리</p>     
        <hr>
        <br>
        <form id="searchForm" action="searchDelivery.ad" method="get" align="center">
            <div class="select" id="search-area">
                <select class="custom-select" name="condition">
                    <option value="tradeNo">거래번호</option>
                    <option value="buyer">구매자 아이디</option>
                    <option value="seller">판매자 아이디</option>
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
       
        <table class="table" align="center" id="deliveryList">
            <thead>
            <tr>
                <th>거래번호</th>
                <th>구매일</th>
                <th>구매자 회원 아이디</th>
                <th>판매자 회원 아이디</th>
                <th>배송상태</th>
            </tr>
            </thead>
            <tbody>
            	<c:forEach var="t" items="${list}">
                	<tr>
                		<td>${t.tradeNo}</td>
                		<td>${t.purchaseDate}</td>
                		<td>${t.buyer}</td>
                		<td>${t.seller}</td>
                		<c:choose>
                			<c:when test="${t.delivery eq 'Y'}">
		                		<td>배송대기</td>
                			</c:when>
                			<c:when test="${t.delivery eq 'A'}">
		                		<td>배송중</td>
                			</c:when>
                			<c:otherwise>
		                		<td>배송완료</td>
                			</c:otherwise>
                		</c:choose>
                	</tr>
                </c:forEach>
            </tbody>
        </table>
        <br>
        
        <script>
         	$(function(){
         		$("#deliveryList>tbody>tr").click(function(){
         			// 클릭될때마다 url 요청 
         			var tno = $(this).children().eq(0).text();
         			
         			location.href = "deliveryDetail.ad?tno="+ tno;
         		})
         	});
        </script>

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
               		<li class="page-item"><a class="page-link bg-secondary text-white" href="searchDelivery.ad?condition=${condition}&keyword=${keyword}&page=${pi.currentPage - 1}">Previous</a></li>
               	</c:when>
               	<c:otherwise>
               		<li class="page-item"><a class="page-link bg-secondary text-white" href="delivery.ad?page=${pi.currentPage - 1}">Previous</a></li>                    	
               	</c:otherwise>
            </c:choose>
            
            <!-- 숫자가 나오는 페이지 버튼 -->
            <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
            	<c:choose>
            		<c:when test="${not empty condition and not empty keyword}">
		            	<li class="page-item"><a class="page-link bg-secondary text-white" href="searchDelivery.ad?condition=${condition}&keyword=${keyword}&page=${p}">${p}</a></li>
            		</c:when>
            		<c:otherwise>
		            	<li class="page-item"><a class="page-link bg-secondary text-white" href="delivery.ad?page=${p}">${p}</a></li>
            		</c:otherwise>
            	</c:choose>
            </c:forEach>
            
            <!-- next 페이지 버튼 -->
            <c:choose>
            	<c:when test="${pi.currentPage eq pi.maxPage}">
              <li class="page-item disabled"><a class="page-link bg-secondary text-white" href="#">Next</a></li>
            	</c:when>
            	<c:when test="${not empty keyword and not empty keyword}">
	              <li class="page-item"><a class="page-link bg-secondary text-white" href="searchDelivery.ad?condition=${condition}&keyword=${keyword}&page=${pi.currentPage + 1}">Next</a></li>
            	</c:when>
            	<c:otherwise>
              <li class="page-item"><a class="page-link bg-secondary text-white" href="delivery.ad?page=${pi.currentPage + 1}">Next</a></li>
            	</c:otherwise>
            </c:choose>
            </ul>
        </div>
    </div>
    
    <br><br>
	<jsp:include page="../../common/footer.jsp" />

</body>
</html>