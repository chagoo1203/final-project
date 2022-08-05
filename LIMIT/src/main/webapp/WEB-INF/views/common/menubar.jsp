<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
    <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>header</title>
    <style>
        #headerWrap{
            width : 1200px;
            overflow: auto;
            background-color: lightgray;
            margin: 0 auto;
        }
        #header1{
            text-align: right;
            border-bottom: 2px solid gray;
            height: 25%;
        }
        #header2{
            height: 75%;
        }
        #header1 > a{
            text-decoration: none;
            color : rgb(59, 59, 59);
            font-weight: 600;
            font-size: small;
            
        }
        #boardTag > a{
            text-decoration: none;
            color : black;
            font-weight: bold;
            font-size: 20px;
            margin-right: 10px;
        }
        #logo{
            display: inline-block;
            font-weight: bold;
            font-size: 36px;
            font-style: oblique;
            margin-left: 25px;
            cursor: pointer;
        }

        #boardTag{
            margin-top: 10px;            
            float: right;            
        }
        
    </style>
</head>
<body>
    <div id="headerWrap">
    	
	<c:if test="${ not empty alertMsg }">
		<script>
			alert("${ alertMsg }");
		</script>
		<c:remove var="alertMsg" scope="session"/>
	</c:if>
		<c:choose>
           	<c:when test="${ empty loginUser }">
		        <div id="header1">
		            <a href="">고객센터</a>
		            <a href="#">공지사항</a>
		            <a href="login.me" style="margin-right : 12.5px">로그인/회원가입</a>
		        </div>
		    </c:when>
		    <c:otherwise>
		    	<c:choose>
		    	<c:when test="${loginUser.userId eq 'admin' }">
	                <!-- 로그인 후 -->
	                <a href="#">고객센터</a>
	                <a href="#">공지사항</a>
	                <a href="myPage.me">관리자페이지</a>
	                <a href="logout.me">로그아웃</a>
                </c:when>
                <c:otherwise>
		                <!-- 로그인 후 -->
		                <a href="#">고객센터</a>
		                <a href="#">공지사항</a>
		                <a href="myPage.me">마이페이지</a>
		                <a href="logout.me">로그아웃</a>
	            </c:otherwise>
	            </c:choose>
            </c:otherwise>            
		</c:choose>
        <div id="header2">
            <div id = "logo" align = "left">
                LIM:IT
            </div>
            <div id ="boardTag" align = "right">
                <a href=""> STYLE </a>
                <a href="resellList.resell"> SHOP </a>
                <a href="enrollForm.used"> USEDSHOP </a>
            </div>
        </div>
    </div>    
</body>
</html>