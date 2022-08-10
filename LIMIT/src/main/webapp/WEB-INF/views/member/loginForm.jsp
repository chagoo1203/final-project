<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>
<style>
.login_outer{
	border : solid 1px black;
	width : 400px;
	height : 450px;
	margin : auto;
	border-radius : 6px;
}
header{
	background-color:lightgray;
	align: center;
	height : 50px;
	text-align: center;
  	padding-top : 5px;
}
.input-box{
    position:relative;
    margin:10px 0;
}
.input-box > input{
    background:transparent;
    border:none;
    border-bottom: solid 1px #ccc;
    padding:20px 0px 5px 0px;
    font-size:14pt;
    width:100%;
}
#loginSubmit{
	width : 100%;
	background-color : 15AC8E; 

}
.enroll{
	display : inline;
	margin-right : 10px;
	float : right;
}
.logSave{
	margin-right : 10px;
	float : right;
}
#aEnroll {
 	 text-decoration: none;
 	 color : black;
}
.formouter{
	padding : 5px 10px;
}

</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" /><br><br>
	<div class="login_outer">
		<header>
			<h2>Login</h2>
		</header><br>
			<form method="post" action="loginForm.me" id="loginForm" name="loginForm" onsubmit="return frm_check();">
		        <div class="formouter">
		            <div class="input-box">
						<label for="userId">아이디 :</label>
						<input type="text" name="userId" id="userId" required>
					</div>
		            <div class="input-box">			
						<label for="userPwd">비밀번호 :</label>
						<input type="password" name="userPwd" id="userPwd" required>
				    </div><br>
					<div class="logSave" style="display:inline;">
					    <input type="checkbox" class="save_id" name="checkId" id="saveId" >
					    <label for="saveId" id="labelSaveId">아이디 저장</label>
					</div>
					<div class="enroll">
						<a href="enrollForm.me" id="aEnroll">회원가입</a>
					</div><br><br><br>
					<input type="submit" id="loginSubmit" value="로그인">
		        </div>    
			</form>
	</div>
	<script>
     $(function() {
         
           fnInit();
         
     });
     
     function frm_check(){
         saveid();
     }
 
    function fnInit(){
        var cookieid = getCookie("saveid");
        console.log(cookieid);
        if(cookieid !=""){
            $("input:checkbox[id='saveId']").prop("checked", true);
            $('#userId').val(cookieid);
        }
        
    }    
 
    function setCookie(name, value, expiredays) {
        var todayDate = new Date();
        todayDate.setTime(todayDate.getTime() + 0);
        if(todayDate > expiredays){
            document.cookie = name + "=" + escape(value) + "; path=/; expires=" + expiredays + ";";
        }else if(todayDate < expiredays){
            todayDate.setDate(todayDate.getDate() + expiredays);
            document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";";
        }
        
        
        console.log(document.cookie);
    }
 
    function getCookie(Name) {
        var search = Name + "=";
        console.log("search : " + search);
        
        if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면 
            offset = document.cookie.indexOf(search);
            console.log("offset : " + offset);
            if (offset != -1) { // 쿠키가 존재하면 
                offset += search.length;
                // set index of beginning of value
                end = document.cookie.indexOf(";", offset);
                console.log("end : " + end);
                // 쿠키 값의 마지막 위치 인덱스 번호 설정 
                if (end == -1)
                    end = document.cookie.length;
                console.log("end위치  : " + end);
                
                return unescape(document.cookie.substring(offset, end));
            }
        }
        return "";
    }
 
    function saveid() {
        var expdate = new Date();
        if ($("#saveId").is(":checked")){
            expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30);
            setCookie("saveid", $("#userId").val(), expdate);
            }else{
           expdate.setTime(expdate.getTime() - 1000 * 3600 * 24 * 30);
            setCookie("saveid", $("#userId").val(), expdate);
             
        }
    }
 
 
    
    
</script>

	<jsp:include page="../common/footer.jsp" />
</body>
</html>