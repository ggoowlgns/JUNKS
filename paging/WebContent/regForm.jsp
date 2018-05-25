<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="dto" class = "testBoard.TestDTO"></jsp:useBean>
	<table width = "50%" align = 'center'>
	<form action = "../reg.jsp" method = "post">
		<input type  = "text" name = "title" placeholder = "제목" size = "47" class = "form-control"><br><br>
		<textarea name = "context" rows="13" cols="50" placeholder = "내용" class = "form-control" ></textarea><br>
		<input type  = "submit" value = "등록" class = "btn btn-danger"><br>
	
	</form>
	</table>
</body>
</html>