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
     #resellCategory{
     		width : 300px;
     		height : 100%;
     		margin : auto;
     }
     #resellList{
     		width : 900px;
     		margin : auto;
     		height : 100%;
     }
     
</style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp" />
	
		<div id="resellWrap">
	
		<div id="shopMenu">Shop</div>
		
        <div align="right" style="border : 1px solid red;">option</div>
        
        <div class="container-fluid">
		  <div class="row">
		    <div id="resellCategory" style="border : 1px solid red;">
		    
                <ul>
               	     카테고리 <br>
                    <span>
                    	<div>
	                        <input type="checkbox" name="clothes" id="clothes">
	                        <label for="clothes">의류</label>
                        </div>
                        <div>
	                        <input type="checkbox" name="shoes" id="shoes">
	                        <label for="shoes">신발</label>
                        </div>
                        <div>
	                        <input type="checkbox" name="etc" id="etc">
	                        <label for="etc">기타</label>
                        </div>
                    </span>
                </ul>
                <ul>
                	브랜드 <br>
                	<span>
                		<div>
	                        <input type="checkbox" name="brand1" id="brand1">
	                        <label for="brand1">브랜드1</label>
                        </div>
                        <div>
	                        <input type="checkbox" name="brand2" id="brand2">
	                        <label for="brand2">브랜드2</label>
                        </div>
                	</span>
                	</ul>
                <ul>컬렉션</ul>
                <ul>신발 사이즈</ul>
                <ul>의류 사이즈</ul>
                <ul>가격</ul>
		    	
		    	
		    </div>
		    <div id="resellList" style="border : 1px solid red;">
		    
		    	리스트
		    	
	    	</div>
		  </div>
		</div>
        
        </div>
	
	<jsp:include page="../common/footer.jsp" />
	

</body>
</html>