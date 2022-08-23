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
</style>
</head>
<body>

	<jsp:include page="../../common/menubar.jsp" />
	<jsp:include page="../adminMenu.jsp" />
	
	<div class="outer">
        <p class="title" align="center">배송 상세 조회</p>     
        <hr>
        <br>
        
        <label>배송번호 : </label>
        <input type="text" readonly class="form-control" value="${t.tradeNo}">
        <br>
        <label>수령인 : </label>
        <input type="text" readonly class="form-control" value="${t.receviverName}">
        <br>
        <label>수령인 전화번호 :  </label>
        <input type="text" readonly class="form-control" value="${t.recevierPhone}">
        <br>
        <label>배송지 :  </label>
        <input type="text" readonly class="form-control" value="${t.recevierAddress}">
        <br>
        <label>배송 요청 사항 : </label>
        <input type="text" readonly class="form-control" value="${t.orderComment}">
        <br>
        <label>결재금액 : </label>
        <input type="text" readonly class="form-control" value="${t.payment}">
        <br>
        <label>구매일 :  </label>
        <input type="text" readonly class="form-control" value="${t.purchaseDate}">
        <br>
        <label>상품번호 :  </label>
        <input type="text" readonly class="form-control" value="${t.productNo}">
        <br>
        <label>구매자 아이디 :  </label>
        <input type="text" readonly class="form-control" value="${t.buyer}">
        <br>
        <label>판매자 아이디 :  </label>
        <input type="text" readonly class="form-control" value="${t.seller}">
        <br>
        <label>리셀 번호 :  </label>
        <input type="text" readonly class="form-control" value="${t.resellNo}">
        <br>
        <label>배송 상태 :   </label>
        <c:choose>
        	<c:when test="${t.delivery eq 'Y'}">
		        <input type="text" readonly class="form-control" value="배송대기">
        	</c:when>
        	<c:when test="${t.delivery eq 'A'}">
        		<input type="text" readonly class="form-control" value="배송중">
        	</c:when>
        	<c:otherwise>
		        <input type="text" readonly class="form-control" value="배송완료">
        	</c:otherwise>
        </c:choose>
        <br>

        <a class="btn btn-secondary" href="delivery.ad">목록보기</a>
        <c:choose>
        	<c:when test="${t.delivery eq 'Y'}">
		        <a href="updateDelivery.ad?tno=${t.tradeNo}&delivery=${t.delivery}" class="btn btn-warning" style="float: right;">상품발송</a>
        	</c:when>
        	<c:when test="${t.delivery eq 'A'}">
		        <a href="updateDelivery.ad?tno=${t.tradeNo}&delivery=${t.delivery}" class="btn btn-warning" style="float: right;">배송완료</a>
        	</c:when>
        	<c:otherwise>
        	</c:otherwise>
        </c:choose>

    </div>
    
    <br><br><br><br clear="both">
	<jsp:include page="../../common/footer.jsp" />

</body>
</html>