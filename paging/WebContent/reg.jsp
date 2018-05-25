<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="dto"  class = "testBoard.TestDTO"></jsp:useBean>
	<jsp:setProperty property="*" name="dto"/>	<!-- 한방에 가져오는 방법 -->
	<jsp:useBean id="dao" class ="testBoard.TestDAO"></jsp:useBean>
	
	<%
	
		dao.insert(dto);
		response.sendRedirect("Include/listInclude.jsp");
	%>
</body>
</html>