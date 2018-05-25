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
	<jsp:useBean id="mb" class ="members.MemberDAO"></jsp:useBean>
	<%
		MemberDTO m = mb.getUserInfo(session.getAttribute("checkName").toString());
	%>
	<form name = "fo" method = "post" action = "../modifyUserReg.jsp">
		이름 : <input type = "text" name = "name" id = "id" value = "<%=m.getName() %>"><br>
		주소 : <input type = "text" name = "addr" id = "addr" value = "<%=m.getAddr() %>"><br>
		전화번호 : <input type = "text" name = "tel" id = "tel" value = "<%=m.getTel() %>"><br>
		<input type = "submit" value = "완료">
		<input type = "button" value = "취소" onClick = "history.back()">
		
	</form>
</body>
</html>