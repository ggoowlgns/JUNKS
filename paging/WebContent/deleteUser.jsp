<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="members.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="mb" class = "members.MemberDAO"></jsp:useBean>
<%mb.deleteUser(session.getAttribute("checkName").toString());

if(session.getAttribute("loginUser").toString().equals(session.getAttribute("checkName").toString())){
	session.removeAttribute("checkName");
	session.removeAttribute("loginUser");
	%>
	
	<script type="text/javascript">
		alert("회원 탈퇴 되었습니다. 되었습니다.");
		location.href = 'Include/loginInclude.jsp';	//로그인 페이지로 이동시켜준다.
	</script>
<% }else{%>
	<script type="text/javascript">
	alert("회원 탈퇴 되었습니다. 되었습니다.");
	location.href = 'Include/memPrintInclude.jsp';	//로그인 페이지로 이동시켜준다.
</script>
<%} %>
	
	
%>

</body>
</html>