<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#tableWrap{
   width: 800px;
   margin-left: 35%;
   margin-top: 15px;
}
td, th{
	text-align : center;
}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<jsp:include page="adminMenu.jsp" />
	
	<div id = "tableWrap">
	<p class="title" align="center">매출관리</p>     
    <hr>
    <br>
		<table class="table">
		  <thead class="thead-light">
		    <tr>
		      <th scope="col">종류</th>
			  <th scope="col" colspan="3" style = "text-align : center">매출액</th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr>
		      <th scope="row">의류</th>
		      <c:choose>
		      	<c:when test="${empty clothingPayment}" >
		      		<td colspan = "3">0</td>
		      	</c:when>
		      	<c:otherwise>
		      		<td colspan = "3" id="clothingPayment">${clothingPayment}</td>
		      	</c:otherwise>
		      </c:choose>		      		     
		    </tr>
		    <tr>
		    <th scope="row">신발</th>
		      <c:choose>
		      	<c:when test="${empty shoosePayment}" >
		      		<td colspan = "3">0</td>
		      	</c:when>
		      	<c:otherwise>
		      		<td colspan = "3" id="shoosePayment">${shoosePayment}</td>
		      	</c:otherwise>
		      </c:choose>	
		    </tr>
		    <tr>
		    <th scope="row">기타</th>
		      <c:choose>
		      	<c:when test="${empty otherPayment}" >
		      		<td colspan = "3">0</td>
		      	</c:when>
		      	<c:otherwise>
		      		<td colspan = "3" id = "otherPayment">${otherPayment}</td>
		      	</c:otherwise>
		      </c:choose>	
		    </tr>
		    <tr>
		      <th scope="row">계</th>
		      <td colspan = "3" id = "resultPayment"></td>		   
		    </tr>
			
		  </tbody>
		</table>
		<script>
				var cval = $("#clothingPayment").text();
				var sval = $("#shoosePayment").text();
				var oval = $("#otherPayment").text();
				
				$("#resultPayment").text(cval + sval + oval); 
		</script>
		<table class="table">
		  <thead class="thead-light">
		    <tr>
		      <th scope="col">월</th>
			  <th scope="col" colspan="3" style = "text-align : center">매출액</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<c:set var = "i" value="7"/>
		  	<c:forEach var = "p" items="${paymentArr}">
		  		<tr>
			      <th scope="row" id="${i}row">test</th>
			      <c:choose>
			      	<c:when test="${empty p}" >
			      		<td colspan = "3">0</td>
			      	</c:when>
			      	<c:otherwise>
			      		<td colspan = "3" id = "otherPayment">${p}</td>
			      	</c:otherwise>
			      </c:choose>		      
			    </tr>
		  		<c:set var = "i" value="${i-1}"/>
		  	</c:forEach>		    
		  </tbody>
		</table>
	</div>
	
	<script>
		$(function(){
			var now = new Date();
			var month = now.getMonth();
			var j = 0;

			for(var i = 7; i >= 2; i--)     {
				
				var el ="#" +  i + "row";

				$(el).html(month - j);

				j++;
			}
			
		})
	</script>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>