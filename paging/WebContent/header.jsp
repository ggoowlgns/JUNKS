<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
       <%request.setCharacterEncoding("utf-8");
      response.setCharacterEncoding("utf-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style >
	.cl{font-size:20pt; color:#E5D85C;}
</style>
</head>
<body>

<dir align = 'center' ><p class = "cl">디후니랑 디요닝</p></dir>
<hr size = '2' >

<dir align = 'right'>

<ul class="nav nav-pills nav-justified">
  <li ><a href="mainInclude.jsp">Home</a></li>
  <li><a href="memPrintInclude.jsp">회 원 정 보</a></li> 
  <%if(session.getAttribute("loginUser")==null){%>
<li><a href="loginInclude.jsp">로 그 인</a></li> 

<%}else{ %>
<li><a href="listInclude.jsp">게 시 판</a></li> 
<li><a href="../logout.jsp">로 그 아 웃</a></li> 

<%} %>
  </ul>
</dir>

<hr size = '2' >
</body>
</html>