<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>
<style>
       /* div{border:1px solid red;} */
       #footer {
           width:80%;
           height:200px;
           margin:auto;
           margin-top:50px;
       }
       #footer-1 {
           width:100%;
           height:20%;
           border-top:1px solid lightgray;
           border-bottom:1px solid lightgray;
           text-align:center;
           
       }
       #footer-2 {width:100%; height:80%;}
       #footer-1, #footer-2 {padding-left:50px;}
       #footer-1>a {
           text-decoration:none;
           font-weight:600;
           margin:10px;
           line-height:40px;
           color:black;
       }
       #footer-2>p {
           margin:0;
           padding:10px;
           font-size:13px;
           text-align : center;
       }
       #p2 {text-align:center;}
</style>
</head>
<body>
	<div id="footer">
        <div id="footer-1">
            <a href="#">회사소개</a> |
            <a href="#">이용약관</a> | 
            <a href="#">개인정보취급방침</a> | 
            <a href="#">인재채용</a>  
        </div>

        <div id="footer-2">
            <p id="p1">
                :LIM:IT 주식회사 : 대표 차현 <br>
                사업자등록번호 : 202-208-03 사업자정보확인 &nbsp; &nbsp; 통신판매업 : 제 2022-서울종로C-종일<br>
                사업장소재지 : 서울특별시 종로구 KH정보교육원 2층 C반 &nbsp; &nbsp; 개인정보관리책임자 : 김명래 <br>
                호스팅서비스 : 네이버 클라우드(주)  &nbsp; &nbsp; @:LIM:IT<br>
            </p>
            <p id="p2">:LIM:IT(주)는 통신판매 중개자로서 통신판매의 당사자가 아니므로 개별 판매자가 등록한 상품정보에 대해서 책임을 지지 않습니다. 단, 거래과정에서 검수하고 보증하는 내용에 대한 책임은 당사에 있습니다.</p>
        </div>
    </div>

</body>
</html>