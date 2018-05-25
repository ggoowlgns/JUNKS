<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
       <%request.setCharacterEncoding("utf-8");
      response.setCharacterEncoding("utf-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
		session.invalidate();	//session 정보 날려주고
	%>
	<script type="text/javascript">
		alert("로그 아웃 되었습니다.");
		location.href = 'Include/loginInclude.jsp';	//로그인 페이지로 이동시켜준다.
	</script>
</body>
</html>