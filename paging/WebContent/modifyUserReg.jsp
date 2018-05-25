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
<%
	MemberDTO m = new MemberDTO();
	
	mb.modifyUserInfo(session.getAttribute("checkName").toString(), request.getParameter("name"), request.getParameter("addr"), request.getParameter("tel"));
	session.setAttribute("checkName", request.getParameter("name"));
	out.print("<script>alert(\"수정이 완료 되셨습니다.\");"+
			"location.href = 'Include/memPrintInclude.jsp';"+"</script>");
%>
</body>
</html>