<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
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
  margin-left: 43%;
}
.form-control{
  resize: none;
  margin-left: 20px;
}
</style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp" />
	<jsp:include page="noticeMenu.jsp" />
	
	<div class="outer">
        <p class="title" align="center">공지사항</p>     
        <hr>
        <br>
        
        <div style="margin-left: 3%;">
          <p>${n.createDate}</p>
          <p style="font-size: 20px;">${n.noticeTitle}</p>
        </div>

        <div>
          <textarea class="form-control" style="width:750px;" rows="15" name="" id="" readonly>
            ${n.noticeContent}
          </textarea>
        </div>
        <br>  
        <a class="btn btn-secondary" href="notice.ct">목록보기</a>
    </div>
	
	<br><br>
	<jsp:include page="../common/footer.jsp" />
	
</body>
</html>