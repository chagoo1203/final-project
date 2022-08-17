<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <style>
        .content {
            background-color:rgb(247, 245, 245);
            width:80%;
            margin:auto;
        }
        .innerOuter {
            border:1px solid lightgray;
            width:80%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }
    </style>
</head>
<body>
    
	<jsp:include page="../common/menubar.jsp" />
	
    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>마이페이지</h2>
            <br>
​
            <form action="update.me" method="post">
                <div class="form-group">
                    <label for="userId"> 아이디 : </label>
                    <input type="text" class="form-control" id="userId" value="${loginUser.userId }" name="userId" readonly> <br>
​
                    <label for="userName"> 이름 : </label>
                    <input type="text" class="form-control" id="userName" value="${loginUser.userName}" name="userName" readonly> <br>
                    
                     <label for=nickName"> &nbsp; 별명 : </label>
                    <input type="text" class="form-control" id="nickName" value="${loginUser.nickName}" name="nickName"> <br>
                    
                     <label for="birthDate"> &nbsp; 생일 : </label>
                    <input type="text" class="form-control" id="birthDate" value="${loginUser.birthDate}" name="birthDate" readonly> <br>
                    
                    <label for="email"> &nbsp; Email : </label>
                    <input type="text" class="form-control" id="email" value="${loginUser.email }" name="email"> <br>


                    <label for="phone"> &nbsp; Phone : </label>
                    <input type="tel" class="form-control" id="phone" value="${loginUser.phone }" name="phone"> <br>
                    
                    <label for="address"> &nbsp; Address : </label>
                    <input type="text" class="form-control" id="address" value="${loginUser.address}" name="address"> <br>
                    
                    <label for=""> &nbsp; 성별 : </label> &nbsp;&nbsp;
                    <input type="radio" id="Male" value="M" name="gender" checked onclick="return(false);">
                    <label for="Male">남자</label> &nbsp;&nbsp;
                    
                    
                    <input type="radio" id="Female" value="F" name="gender" onclick="return(false);">
                    <label for="Female">여자</label> &nbsp;&nbsp;
                	
                </div> 
                <script>
                	$(function(){
                	if("${loginUser.gender }" != "" ){
                			$('input[value="${loginUser.gender}"]').attr("checked",true);
                		
                		}
                	})
                
                </script>
                <br>
                <div class="btns" align="center">
                    <button type="submit" class="btn btn-primary">수정하기</button>
                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteForm">회원탈퇴</button>
                </div>
            </form>
        </div>
        <br><br>
        
    </div>
​
    <!-- 회원탈퇴 버튼 클릭 시 보여질 Modal -->
    <div class="modal fade" id="deleteForm">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
​
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">회원탈퇴</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
​
                <form action="" method="post">
                    <!-- Modal body -->
                    <div class="modal-body">
                        <div align="center">
                            탈퇴 후 복구가 불가능합니다. <br>
                            정말로 탈퇴 하시겠습니까? <br>
                        </div>
                        <br>
                            <label for="userPwd" class="mr-sm-2">Password : </label>
                            <input type="text" class="form-control mb-2 mr-sm-2" placeholder="Enter Password" id="userPwd" name=""> <br>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer" align="center">
                        <button type="submit" class="btn btn-danger">탈퇴하기</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
​
  <jsp:include page="../common/footer.jsp" />
​
</body>
</html>
