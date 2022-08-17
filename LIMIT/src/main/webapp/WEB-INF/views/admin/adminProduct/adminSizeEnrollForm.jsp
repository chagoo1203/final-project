<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<style>
input[type="checkbox"]{
    cursor: pointer;
    width: 25px;
    height: 25px;
}
.outer{
    width: 1000px;
    margin: auto;
}
.inner{
    margin-left: 25%;
}
.btn{
    float: right;
    margin-right: 40%;
    margin-top: 15px;
}
label{
    font-size: 25px;
}
.title {
	font-size: xx-large;
	font-weight: bold;
}
</style>
</head>
<body>

	<jsp:include page="../../common/menubar.jsp" />
	
	<div class="outer">
        <p class="title" align="center">상품 등록</p>     
        <hr>
        <br>
        
        <div class="inner">
        
  		<c:if test="${p.productTypeName eq '신발'}">
	        <form action="insertSize.rs" method="post" enctype="multipart/form-data">
	            <input type="hidden" name="productNo" value="${p.productNo}">
	            <label><b>SIZE</b></label><br><br>
	            <label for="225"><input type="checkbox" name="sizes" id="225" value="225">225</label> &nbsp &nbsp
	            <label for="230"><input type="checkbox" name="sizes" id="230" value="230">230</label> &nbsp &nbsp
	            <label for="235"><input type="checkbox" name="sizes" id="235" value="235">235</label> &nbsp &nbsp
	            <label for="240"><input type="checkbox" name="sizes" id="240" value="240">240</label>  &nbsp &nbsp
	            <label for="245"><input type="checkbox" name="sizes" id="245" value="245">245</label><br>
	            <label for="250"><input type="checkbox" name="sizes" id="250" value="250">250</label> &nbsp &nbsp
	            <label for="255"><input type="checkbox" name="sizes" id="255" value="255">255</label> &nbsp &nbsp
	            <label for="260"><input type="checkbox" name="sizes" id="260" value="260">260</label> &nbsp &nbsp
	            <label for="265"><input type="checkbox" name="sizes" id="265" value="265">265</label> &nbsp &nbsp
	            <label for="270"><input type="checkbox" name="sizes" id="270" value="270">270</label><br>
	            <label for="275"><input type="checkbox" name="sizes" id="275" value="275">275</label> &nbsp &nbsp
	            <label for="280"><input type="checkbox" name="sizes" id="280" value="280">280</label> &nbsp &nbsp
	            <label for="285"><input type="checkbox" name="sizes" id="285" value="285">285</label> &nbsp &nbsp
	            <label for="290"><input type="checkbox" name="sizes" id="290" value="290">290</label> &nbsp &nbsp
	            <label for="295"><input type="checkbox" name="sizes" id="295" value="295">295</label> &nbsp &nbsp
	            <br>
	            <button type="submit" class="btn btn-secondary">등록</button>
	        </form>
  		</c:if>
  		
		<c:if test="${p.productTypeName eq '의류'}">
	        <br>
	        <form action="insertSize.rs" enctype="multipart/form-data" method="post">
	            <input type="hidden" name="productNo" value="${p.productNo}">
	            <label><b>SIZE</b></label><br><br>
	            <label for="XS"><input type="checkbox" name="sizes" id="XS" value="XS">XS</label> &nbsp &nbsp
	            <label for="S"><input type="checkbox" name="sizes" id="S" value="S">S</label> &nbsp &nbsp
	            <label for="M"><input type="checkbox" name="sizes" id="M" value="M">M</label> &nbsp &nbsp
	            <label for="L"><input type="checkbox" name="sizes" id="L" value="L">L</label> &nbsp &nbsp
	            <label for="XL"><input type="checkbox" name="sizes" id="XL" value="XL">XL</label>
	            <br>
	            <button type="submit" class="btn btn-secondary">등록</button>
	        </form>
 		</c:if>
 		
 		<c:if test="${p.productTypeName eq '기타'}">
 			리셀 상품 등록이 완료 되었습니다
 			<a class="btn btn-secondary" href="admin.ad">완료</a>
 		</c:if>
		</div>
    </div>
	
	<br><br><br><br clear="both">
	<jsp:include page="../../common/footer.jsp" />



</body>
</html>