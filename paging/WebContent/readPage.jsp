<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style>
	
</style>
</head>
<body>
<jsp:useBean id="dto" class = "testBoard.TestDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>	<!-- 한방에 가져오는 방법 -->
<jsp:useBean id="dao" class = "testBoard.TestDAO"></jsp:useBean>

<%
	String num = request.getParameter("num");
	dao.count(num);
	
	dto = dao.readPage(request.getParameter("title"));
%>

<div align = 'center'>제목 : <%= dto.getTitle() %>  <br>조회수 : <%=dto.getCount()%></div><br><br>
<%if(dto.getContext() == null){ %>
<div align = 'left' >내용: <h2>ㅈ ㄱ ㄴ</h2></div><br>
<%}else{ %>
<div align = 'center'>내용 : <%= dto.getContext() %></div><br>
<%} %>
<div align = 'right'><button type = "button" onClick = "location.href = 'listInclude.jsp'" >목록</button></div>

</body>
</html>