<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import = "members.MemberDTO" %>
       <%request.setCharacterEncoding("utf-8");
      response.setCharacterEncoding("utf-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id = "mb" class ="members.MemberDAO"/>
	<%	
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		MemberDTO m = mb.chkUser(id, pwd);
		if(m != null){
			session.setAttribute("loginUser", m.getName());
			
			%>
			<script type="text/javascript">
			alert("<%=session.getAttribute("loginUser") %> 님 반갑습니다.");
			location.href = 'Include/memPrintInclude.jsp';	//메인 페이지로 이동시킨다.
			</script>
		<% 
		}
	%>

	<script type="text/javascript">
			alert("일치하는 아이디가 없습니다..");
			location.href = 'Include/loginInclude.jsp';	//로그인 페이지로 이동시켜준다.
	</script>
	
</body>
</html>