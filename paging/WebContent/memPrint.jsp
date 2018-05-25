<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import = "members.*" %>
    <%response.setCharacterEncoding("utf-8"); 
	request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
	a.no-uline { text-decoration:none }
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id = "mb" class = "members.MemberDAO"/>
<%if(session.getAttribute("loginUser")==null){ %>
<div align = 'center'><h3>로그인이나 하십시오..</h3></div>
<%}else{ %>
<%ArrayList<MemberDTO> members = mb.memberView();	//멤버들의 값을 ArrayList값으로 모두 가져오게된다. %>
<h3><%=session.getAttribute("loginUser") %>님의  페이지.</h3>
	<table border = 1>
	<tr>
		
		<td width = 90>NAME</td>
		<td width = 50>ADDR</td>
		<td width = 50>TEL</td>
	</tr>
	<%for(MemberDTO member : members){ %>
	<tr>
		
		<td  align = 'center' width = 90><a style = "text-decoration:none" href = "memberInfoInclude.jsp?name=<%=member.getName()%>"><%=member.getName()%></a></td>
		<td align = 'center' width = 50><%=member.getAddr() %></td>
		<td align = 'center' width = 50><%=member.getTel() %></td>
	</tr>
	<%} %>
	</table>
	
	
	<%} %>
</body>
</html>