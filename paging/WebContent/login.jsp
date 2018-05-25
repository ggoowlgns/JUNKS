<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%response.setCharacterEncoding("utf-8"); 
	request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
		<%// 특정 쿠키만 삭제하기
		Cookie kc = new Cookie("idUsed", null) ;
		kc.setMaxAge(0) ;
		response.addCookie(kc) ; %>
		
	<% if(session.getAttribute("loginUser")== null){
		session.invalidate();
		%>
<div align = 'center'>
<form method = "post" action = "../chkUser.jsp">
	<input type = "text" name = "id" id = "id" placeholder = "id"><br><br>
	<input type = "password" name = "pwd" id = "pwd" placeholder = "password"><br><br>
	<input type = "submit" value = "로그인" class="btn btn-default">  
	<input type = "button" value = "회원 가입" onclick="location.href = 'registInclude.jsp'" class="btn btn-default"><br>
</form>
</div>
	<%}else{
		out.print(session.getAttribute("loginUser")+"님 로그인  상태 입니다.<br><br>");
		out.print("<form method = 'post' action = 'mainInclude.jsp'>");
		out.print("<input type = \"submit\" value = \"main이동\">  ");
		out.print("</form> ");
	} %>
	
</body>
</html>