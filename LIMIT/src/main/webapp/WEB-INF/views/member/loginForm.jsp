<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<form method="post" action="loginForm.me" id="loginForm" name="loginForm" onsubmit="return frm_check();">
		<table id="table" align="center">
			<tr><td><input type="text" name="userId" id="userId" required placeholder=" 아이디"></td></tr>
			<tr><td><input type="password" name="userPwd" id="userPwd" required placeholder=" 비밀번호"></td></tr>
		</table>
		<div class="logSave" align="center">
		    <input type="checkbox" class="save_id" name="checkId" id="saveId" >
		    <label for="saveId">아이디 저장</label>
		</div>
		<div align="center">
			<button type="submit" class="btn btn-sm btn-info">로그인</button>
		</div>
	</form>
	<div align="center">
		<a href="enrollForm.me" class="btn btn-sm btn-warning">회원가입</a>
		<a href="enrollForm.me" class="btn btn-sm btn-warning">아이디/비밀번호 찾기</a>
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