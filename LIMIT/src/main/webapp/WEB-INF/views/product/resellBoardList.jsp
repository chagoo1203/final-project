<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리셀 상품 리스트</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
	#resellWrap{
           width : 1200px;
           overflow: auto;
           margin: 0 auto;
       }
	 #shopMenu{
            font-weight: bold;
            font-size: 30px;
            cursor: pointer;
            margin-top : 10px;
            text-align: center;
        }
     .resellList{
     		width : 900px;
     		margin : auto;
     		margin-top : 0px;
     		height : 100%;
     }
     .thumbnail{
     		width : 225px;
     		margin : auto;
     		display : inline-block;
     }
     .thumbnail > img{
     		width : 200px;
     		height : 200px;
     		margin : auto;
     		display : inline-block;
     }
     table{
     	margin-left : 15px;
     	
     }
     
</style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp" />
	
		<div id="resellWrap">
	
		<div id="shopMenu">Shop</div>
		
        <div align="right" style="border : 1px solid red;">option</div>
        
        <jsp:include page="resellBoardFilter.jsp" />
        
		    <div class="resellList" style="border : 1px solid red;">
		    
		    	<div class="thumbnail" style="border : 1px solid red;" align="center">
					<img class="resellThumbnail" src="../../webapp/resources/resellListImges/rabbit.jpg">
					<table align="left">
						<tr>
							<th>브랜드</th>
						</tr>
						<tr>
							<td>이름</td>
						</tr>
						<tr>
							<td>이름2</td>
						</tr>
						<tr>
							<td>가격</td>
						</tr>
					
					</table>		    	
		    	</div>
		    	<div class="thumbnail" style="border : 1px solid red;" align="center">
					<img class="resellThumbnail" src="../../webapp/resources/resellListImges/rabbit.jpg">
					<table align="left">
						<tr>
							<th>브랜드</th>
						</tr>
						<tr>
							<td>이름</td>
						</tr>
						<tr>
							<td>이름2</td>
						</tr>
						<tr>
							<td>가격</td>
						</tr>
					
					</table>		    	
		    	</div>
		    	<div class="thumbnail" style="border : 1px solid red;" align="center">
					<img class="resellThumbnail" src="../../webapp/resources/resellListImges/rabbit.jpg">
					<table align="left">
						<tr>
							<th>브랜드</th>
						</tr>
						<tr>
							<td>이름</td>
						</tr>
						<tr>
							<td>이름2</td>
						</tr>
						<tr>
							<td>가격</td>
						</tr>
					
					</table>		    	
		    	</div>
		    	<div class="thumbnail" style="border : 1px solid red;" align="center">
					<img class="resellThumbnail" src="../../webapp/resources/resellListImges/rabbit.jpg">
					<table align="left">
						<tr>
							<th>브랜드</th>
						</tr>
						<tr>
							<td>이름</td>
						</tr>
						<tr>
							<td>이름2</td>
						</tr>
						<tr>
							<td>가격</td>
						</tr>
					
					</table>		    	
		    	</div>
		    	<div class="thumbnail" style="border : 1px solid red;" align="center">
					<img class="resellThumbnail" src="../../webapp/resources/resellListImges/rabbit.jpg">
					<table align="left">
						<tr>
							<th>브랜드</th>
						</tr>
						<tr>
							<td>이름</td>
						</tr>
						<tr>
							<td>이름2</td>
						</tr>
						<tr>
							<td>가격</td>
						</tr>
					
					</table>		    	
		    	</div>
		    	
	    	</div>
		  </div>
        
	
	<jsp:include page="../common/footer.jsp" />
	

</body>
</html>