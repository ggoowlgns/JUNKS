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
<jsp:useBean id = "mb" class = "members.MemberDAO" />
	<%	/* 아이디 중복 확인용 cookie 확인 */
		boolean bool = false;
				
		Cookie[] cookieArr = request.getCookies();	//사용자의 모든 쿠키값을 가져온다.
		
		if(cookieArr != null){
			for(Cookie c: cookieArr){
				if(c.getName().equals("idUsed")){
					bool = true;	//cookie 값이 존재하면 true 로 만들어서 아래의 if 문이 작동하지 않게 해준다.
					
				}
			}
		}
	%>
	<%	if(bool){
		mb.registUser(request.getParameter("id"), request.getParameter("pwd"), request.getParameter("name"), request.getParameter("addr"), request.getParameter("tel"));
		session.setAttribute("loginUser", request.getParameter("name"));
		session.removeAttribute("permitId");//회원가입때 작성한 id 세션 삭제
		
		
		// 특정 쿠키만 삭제하기
	    Cookie kc = new Cookie("idUsed", null) ;
	    kc.setMaxAge(0) ;
	    response.addCookie(kc) ;


		out.print("<script>alert(\"회원 가입이 되셨습니다.\");"+
				"location.href = 'Include/memPrintInclude.jsp';"+"</script>");
		//response.sendRedirect("login.jsp");
		}else{
			out.print("<script>alert(\"중복확인을 해주십시요.\");"+
					"location.href = history.back();"+"</script>");
		}
	%>
	
</body>
</html>