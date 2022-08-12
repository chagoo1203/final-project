<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
        <p class="title" align="center">공지사항</p>     
        <hr>
        <br>
        <div class="container">           
            <table class="table">
              <tbody>
                <tr>
                  <td>[공지] 이용약관 안내</td>
                </tr>
                <tr>
                  <td>[공지] 이용약관 안내</td>
                </tr>
                <tr>
                  <td>[공지] 이용약관 안내</td>
                </tr>
              </tbody>
            </table>
          </div>
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
	<jsp:include page="../common/footer.jsp" />

</body>
</html>