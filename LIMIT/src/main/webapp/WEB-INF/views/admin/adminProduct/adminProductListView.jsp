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
</style>
</head>
<body>

	<jsp:include page="../../common/menubar.jsp" />
	<jsp:include page="../adminMenu.jsp" />
	
	<div class="outer">
        <p class="title" align="center">상품 관리</p>     
        <hr>
        <br>
        <form id="searchForm" action="" method="get" align="center">
            <div class="select">
                <select class="custom-select" name="condition">
                    <option value="writer">컬렉션 명</option>
                    <option value="title">브랜드 명</option>
                </select>
            </div>
            <div class="text">
                <input type="text" class="form-control" name="keyword">
            </div>
            <button type="submit" class="searchBtn btn btn-secondary">검색</button>
        </form>
        
        <table class="table" align="center">
            <thead class="thead-light">
            <tr>
                <th>상품번호</th>
                <th>컬렉션명</th>
                <th>브랜드명</th>
                <th>카테고리</th>
                <th>거래량</th>
                <th>등록일자</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>10</td>
                <td>조던1 미드 SE</td>
                <td>나이키</td>
                <td>신발</td>
                <td>15</td>
                <td>2022-06-30</td>
            </tr>
            <tr>
                <td>9</td>
                <td>스마트워치</td>
                <td>애플</td>
                <td>기타</td>
                <td>15</td>
                <td>2022-06-30</td>
            </tr>
            <tr>
                <td>8</td>
                <td>옷</td>
                <td>아디다스</td>
                <td>의류</td>
                <td>15</td>
                <td>2022-06-30</td>
            </tr>
            </tbody>
        </table>

		<a class="btn btn-secondary" href="productEnrollForm.rs">상품등록</a>

        <br><br><br><br>
        <div class="container">                  
            <ul class="pagination justify-content-center pagination-sm">
              <li class="page-item"><a class="page-link bg-secondary text-white" href="#">Previous</a></li>
              <li class="page-item"><a class="page-link bg-secondary text-white" href="#">1</a></li>
              <li class="page-item"><a class="page-link bg-secondary text-white" href="#">2</a></li>
              <li class="page-item"><a class="page-link bg-secondary text-white" href="#">3</a></li>
              <li class="page-item"><a class="page-link bg-secondary text-white" href="#">Next</a></li>
            </ul>
        </div>
         
    </div>
	
	
	<br><br><br><br><br><br><br><br clear="both">
	<jsp:include page="../../common/footer.jsp" />

</body>
</html>