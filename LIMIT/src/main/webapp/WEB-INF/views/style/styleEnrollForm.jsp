<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스타일 입력폼</title>
    <style>
        div{
            box-sizing: border-box;
        }
        a{
            text-decoration: none;
            color: black;
        }
        li{
            list-style: none;
            float: left;
         }
        #wrap{
        	
            margin: auto;
            width: 1200px;
            height: 1200px;
        }
        #insert_area{
            width: 60%;
            margin: auto;
            height: 1200px;
        }
        #pictures >img{
            margin-left: 60px;
            width: 600px;
            height: 600px;
        }
        #insert_area > button{
            margin: 5px;
            margin-left: 100px;
        }
        .product_name{
            font-size: small;
        }
        #product_list_area{
            width: 600px;
            height: 400px;
        }
        .product > picture > img{
            width: 120px;
            height: 120px;
        }
        .product_info{
            width: 150px;
        }
        .submit{
            width: 500px;

        }
        </style>
</head>
<body>
	   <jsp:include page="../common/menubar.jsp" />
	   <div style="width:1200px; height:100px"></div>

	  <div id="wrap">
        <form action="insertStyle.bo" method="post" enctype="multipart/form-data">
			<input type="hidden" name="styleWriter" value="${ loginUser.userId }">
            
            <div id="insert_area">
            
                <div id="pictures">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS19qRJ378QvEm6CXiFecdqj7SdIzU7-Bc2hw&usqp=CAU"">
                </div>
                
                <button>썸네일</button><button>사진1</button><button>사진2</button><button>사진3</button>

                <input id="1" type="hidden" type="file" name="file" required>
                <input id="2" type="hidden" type="file" name="file"> 
                <input id="3" type="hidden" type="file" name="file">
                <input id="4" type="hidden" type="file" name="file">
                <br><br><br><br>

                <textarea name="styleContent" id="" cols="70" rows="10" style="resize: none; margin-left:75px ;"
                placeholder="해시태그또는 내용을 입력해주세요" required></textarea>
                <br><br><br><br>
                
                

                <div id="product_tag_area">
                    <p>상품태그 N개</p>
                    <input type="text" name="styleTag" id="" placeholder="상품검색"> <button>검색</button>
                </div>
                
                <br><br><br><br><br><br><br><br>
                
                <div id="product_list_area">
                    <!-- 
                    <ul class="produt_list">
                        <li class="product_items">
                            <a href="">
                                <div class="product">
                                    <picture>
                                        <img src="https://kream-phinf.pstatic.net/MjAyMTA3MjZfMTUz/MDAxNjI3MjYzNjE1Mzgw.BSpjIuYP9gjkLxRg5GdHOPeIzqLX4M2YKcySSYOaIhUg.HGv-zJfu6o8YCtSajmbV2_CGQLISs68WaYx-88HueOEg.JPEG/p_3039e3527f9c4a1d82d0ccce125b12a2.jpg?type=s_webp" alt="">
                                    </picture>
                                </div>
                                <div class="product_info">
                                    <p class="product_name">IAB Studio Pigment T-Shirt Oatmel</p>
                                    <div class="amount">
                                        113,000 원
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <div class="product">
                                    <picture>
                                        <img src="https://kream-phinf.pstatic.net/MjAyMTA3MjZfMTUz/MDAxNjI3MjYzNjE1Mzgw.BSpjIuYP9gjkLxRg5GdHOPeIzqLX4M2YKcySSYOaIhUg.HGv-zJfu6o8YCtSajmbV2_CGQLISs68WaYx-88HueOEg.JPEG/p_3039e3527f9c4a1d82d0ccce125b12a2.jpg?type=s_webp" alt="">
                                    </picture>
                                </div>
                                <div class="product_info">
                                    <p class="product_name">IAB Studio Pigment T-Shirt Oatmeal</p>
                                    <div class="amount">
                                        113,000 원
                                    </div>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
                     -->
                <div class="submit">
                    <button type="submit" style="margin-left: 250px;">작성</button>
                    <button type="reset">되돌리기</button>
                </div>

            </div>
            
        </form>
	<jsp:include page="../common/footer.jsp" />
    </div>
	
	
	
	
	
	
	
	
</body>
</html>