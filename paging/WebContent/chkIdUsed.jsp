<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import = "members.*" %>
       <%request.setCharacterEncoding("utf-8");
      response.setCharacterEncoding("utf-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id = "mb" class = "members.MemberDAO"/>

	
	
	<%	
		String id = request.getParameter("idUsed");
		if(id!=null){
			if(!mb.chkIdUsed(id)){
				Cookie cookie = new Cookie("idUsed" , "notUsed");	//만든 쿠키는 이전 페이지에도 공유한다.
				cookie.setMaxAge(100);
				response.addCookie(cookie);
				session.setAttribute("permitId", id);
				
	
				%>
			<%}else{
				// 특정 쿠키만 삭제하기
				Cookie kc = new Cookie("idUsed", null) ;
				kc.setMaxAge(0) ;
				response.addCookie(kc) ; %>
				<script>alert("중복됩니다. 다른걸 입력해주세요")</script>
			<%}
		}else{ %><script>alert("아이디를입력 하세요")</script><%}%>
	%><script>location.href = "Include/registInclude.jsp";</script>
	
</body>
</html>