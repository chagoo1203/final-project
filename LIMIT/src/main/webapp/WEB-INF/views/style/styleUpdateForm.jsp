<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스타일 수정</title>
    <style>
        div{
            box-sizing: border-box;
            border: 1px solid red;
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
	    <div id="wrap">
        <form action="updateStyle">

            <div id="insert_area">
                <div id="pictures">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS19qRJ378QvEm6CXiFecdqj7SdIzU7-Bc2hw&usqp=CAU" alt="">
                </div>
                

                <br><br><br><br>
                <textarea name="" id="" cols="70" rows="10" style="resize: none; margin-left:75px ;"
                placeholder="해시태그또는 내용을 입력해주세요" required>ㅋㅋㅋ</textarea>
                <br><br><br><br>
                
                
                <br><br>
                
              
                <div class="submit">
                    <button type="submit" style="margin-left: 250px;">수정</button>
                    <button type="reset">되돌리기</button>
                </div>

            </div>
            
        </form>
    </div>
    <jsp:include page="../common/footer.jsp" />
</body>
</html>