<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스타일 리스트</title>
<style>
    div{
   
        box-sizing: border-box;
    }
    .wrap{
        margin: auto;
        width: 1200px;
       
    }

    #hash_tag{
        width: 100%;
        height: 300px;
    }
    li{
        list-style: none;
    }
    a{
        text-decoration: none;
        color: black;
    }

    #hash_bar{
        width : 1200px;

        height : 50px;
    
        position: absolute;
        left: 50%;
        top: 40%;
        margin-left: -600px;
        margin-top: -150px;


    }

    #style_tab_lst{
        width : 1200px;

        height : 50px;

        position: absolute;
        left: 50%;
        top: 35%;
        margin-left: -600px;
        margin-top: -150px;
    }
    .style_feeds > div{float: left;}
    .style_feeds{
        width: 1200px;
        height: auto;
    }
    .style{
            
            width: 20%;
            height: 70%;
            text-align: center;
            cursor: pointer;
            border: 1px solid black;
            border-radius:10px;
            margin: 10px;
            margin-left: 40px;
    }
    .style > img{
        width: auto;
        height: auto;
    }


    .option  {
        font-size: larger;
    }
  
</style>
</head>
<body>
	  <jsp:include page="../common/menubar.jsp" />
    <div class="wrap">
        <div id="style_tab_lst" align="center">
            <a href="" class="option">인기</a> <a href="" class="option">최신</a> <a href="" class="option">팔로잉</a>
        </div>
        <div id="hash_tag">
            <div id="hash_bar" align="center">#나이키 #아디다스 #조던1 </div>
        </div>
        

        <div class="style_feeds" >
        
            <c:if test="${ not empty loginUser }"> 
	            <a href="styleEnrollForm.bo" style="margin-left: 1080px;">작성하기</a>
	            <br>
			</c:if>
			
			
			<c:forEach var="b" items="${ list }">
			
			
            <div class="style">
                <img src="data:image/jpeg;base64,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" alt="">
                <p>#리밋챌린지# limit스타일 #데일리룩 #나이키</p>
                <ul>
                    <li>
                        <a href="">
                            <p class="product_name">Nike Air Force 1 '07 Low White </p>    
                            <p class="price_box">132000원</p>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <p class="product_name">Jordan 1 Retro Low OG Black and Dark Powder Blue </p>    
                            <p class="price_box">132000원</p>
                        </a>
                    </li>
                </ul>
            </div>  
            
            </c:forEach>                
        </div>
    
    </div>
    <br clear="both">
    <jsp:include page="../common/footer.jsp" />
    
    
    
    
</body>
</html>