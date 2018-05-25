<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="members.*" %>
       <%request.setCharacterEncoding("utf-8");
      response.setCharacterEncoding("utf-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="mb" class = "members.MemberDAO"></jsp:useBean>
<%if(session.getAttribute("loginUser")==null){ %>
<div align = 'center'><h3>로그인이나 하십시오..</h3></div>
<%}else{ %>
<%
	MemberDTO m = mb.getUserInfo(request.getParameter("name"));
	session.setAttribute("checkName", request.getParameter("name"));
	
%>

			ID : <%=m.getId()%> <br>
			PWD : <%=m.getPwd() %><br>	
			이름 : <%=m.getName() %><br>
			주소 : <%=m.getAddr() %><br>
			전화번호: <%=m.getTel()%><br>
			
		<input type = "button" value = "수정하기" onClick = "location.href = 'modifyInclude.jsp'">
		
		
		<input type = "button" value = "탈퇴하기" onClick = "location.href = '../deleteUser.jsp'">
<%} %>
</body>
</html>