<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import =  "members.MemberDTO" %>
   <%request.setCharacterEncoding("utf-8");
      response.setCharacterEncoding("utf-8");%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<jsp:useBean id = "mb" class = "members.MemberDAO"/>
<script>


function pwdChk1(){
	pw1 = document.getElementById("pwd").value;
	pw2 = document.getElementById("pwd2").value;
	
	if(document.getElementById("pwd2").value != ""){
		if(pw1 == pw2){
			document.getElementById("pwlab").innerHTML = "확인!!";	
		}else{
			document.getElementById("pwlab").innerHTML = "불일치!!!";	
			document.getElementById("pwd").value = "";
			document.getElementById("pwd2").value = "";
		}
	}
	
}
function pwdChk2(){
	pw1 = document.getElementById("pwd").value;
	pw2 = document.getElementById("pwd2").value;
	if(pw1 == pw2){
		document.getElementById("pwlab").innerHTML = "확인!!";	
	}else{
		document.getElementById("pwlab").innerHTML = "불일치!!!";	
		document.getElementById("pwd").value = "";
		document.getElementById("pwd2").value = "";
	}
	
}

function regist(){
	if(document.getElementById("pwd").value == ""){
		alert("비밀번호를 입력하여 주십시오.");
	}if(document.getElementById("id").value == ""){
		alert("아이디를 입력하여 주십시오.");
	}if(document.getElementById("name").value == ""){
		alert("이름을 입력하여 주십시오.");
	}if(document.cookie.indexOf("idUsed")==null){ /* 쿠키 값 존재하는지 확인 */
		alert("중복 체크 확인을 해주십시오.")
	}else if((document.getElementById("pwd").value != "")&&(document.getElementById("id").value != "")&&(document.getElementById("name").value != "")){
			
		document.fo.submit();	/* "submit" 이랑 같은 처리를 한다.(값을 다음 페이지로 넘겨준다.) */
				
	}
}

function chkIdUsed() {
	if(document.getElementById("id").value != ""){
		location.href = "../chkIdUsed.jsp?idUsed="+document.getElementById("id").value+"";
		
	}else {alert("아이디를 입력하세요!")}
}
	
</script>

</head>
<body>

	<%	/* 아이디 중복 확인용 cookie 확인 */
		boolean bool = false;
				
		Cookie[] cookieArr = request.getCookies();	//사용자의 모든 쿠키값을 가져온다.
		
		if(cookieArr != null){
			for(Cookie c: cookieArr){
				if(c.getName().equals("idUsed")){
					bool = true;	//cookie 값이 존재하면 true 로 만들어서 아래의 if 문이 작동하지 않게 해준다.
					
				}
			}
		}
	%>
<div align = 'left' style = padding-left:40px;>
<form name = "fo" method = "post" action = "../regUser.jsp">
	<%if(session.getAttribute("permitId")!=null){ 
		%>
	<input type = "text" name = "id" id = "id" onChange = "chkIdUsed()" value = "<%=session.getAttribute("permitId") %>" >
	<%}else  %><input type = "text" name = "id" id = "id" placeholder = "아이디" onChange = "chkIdUsed()">
		
		<%if(!bool){ %>  
			<input type = "button"  value = "중복 체크" onClick = "chkIdUsed()" class="btn btn-default"><br>
		<%}else{ %>
			<label>(사용가능한 아이디 입니다.)</label><input type = "button"  value = "중복 체크" onClick = "chkIdUsed()" class="btn btn-default"><br>
		<%} %>
	
	<input type = "password" name = "pwd" id = "pwd" placeholder = "비밀번호" onChange = "pwdChk1()"><br>
	<input type = "password" name = "pwd2" id = "pwd2" placeholder = "비밀번호 확인" onChange = "pwdChk2()">
	<label id = "pwlab" >(*필수 항목)</label><br>
	<input type = "text" name = "name" id = "name" placeholder = "이름"><br>
	<input type = "text" name = "addr" id = "addr" placeholder = "주소"><br>
	<input type = "text" name = "tel" id = "tel" placeholder = "전화번호"><br>
	<input type = "button" value = "가입 하기" onClick = "regist()" class="btn btn-default">
	
</form>
</div>
</body>
</html>