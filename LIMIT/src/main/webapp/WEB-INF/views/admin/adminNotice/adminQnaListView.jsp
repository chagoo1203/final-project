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
div{
    border: 1px solid red;
}
.outer{
    border: 1px solid red;
    width: 750px;
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
            <buttot class="btn btn-secondary">글작성</buttot>
        </div>
        <br>
        <table class="table" align="center">
            <thead class="thead-light">
            <tr>
                <th>글번호</th>
                <th>글제목</th>
                <th>조회수</th>
                <th>작성일</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>10</td>
                <td>[Q&A] 회원가입 문의</td>
                <td>60</td>
                <td>2000-10-10</td>
            </tr>
            <tr>
                <td>10</td>
                <td>[Q&A] 회원가입 문의</td>
                <td>60</td>
                <td>2000-10-10</td>
            </tr>
            <tr>
                <td>10</td>
                <td>[Q&A] 회원가입 문의</td>
                <td>60</td>
                <td>2000-10-10</td>
            </tr>
            </tbody>
        </table>
        <br>

        <br><br><br>
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
	
	
	<br><br>
	<jsp:include page="../../common/footer.jsp" />

</body>
</html>