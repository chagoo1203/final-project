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
        }
        a{
            text-decoration: none;
            color: black;
        }
       
        #wrap{
            margin: auto;
            width: 1200px;
        }
         #style_detail{
            width: 60%;
            margin: auto;

        }
        
        #pictures >img{
            margin-left: 150px;
            width: auto;
            height: 300px;
        }
        #insert_area > button{
            margin: 5px;
            margin-left: 100px;
        }
        
        .submit{
            width: 500px;

        }
        </style>
</head>
<body>
  <jsp:include page="../common/menubar.jsp" />
	    <div id="wrap">
	    <div id="style_detail">
	        <form action="update.st" method="post">
				 <input type="hidden" name="styleNo" value="${s.styleNo }">
	             <div id="insert_area">
	                <div id="pictures">
	                
	                        <c:forEach var="att" items="${ attlist }">
								<img src="${ att.filePath }" style="width:400px">       
		            		</c:forEach>
		            		
	                </div>
	                
	
	                <br><br><br><br>
	                <textarea name="styleContent" id="" cols="70" rows="10" style="resize: none; margin-left:75px ;"
	                placeholder="해시태그또는 내용을 입력해주세요" required>${s.styleContent }</textarea>
	                <br><br><br><br>
	                
	                
	                <br><br>
	                
	              
	                <div class="submit">
	                    <button type="submit" style="margin-left: 250px;">수정</button>
	                    <button type="reset">되돌리기</button>
	                </div>
	
	            </div>
	            
	        </form>
	    </div>
	</div>
    <jsp:include page="../common/footer.jsp" />
</body>
</html>