<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

</head>
<body>
<%@page import = "testBoard.TestDTO" %>

<jsp:useBean id = "dao" class = "testBoard.TestDAO"/>

<%
	String start = request.getParameter("start");
	if(start == null){
		start = "1";
	}
	int intStart = Integer.parseInt(start);	//시작 페이지 찾기
	int totalPage = dao.getTotalPage();
	
	ArrayList<TestDTO> listDTO = dao.list(intStart,totalPage);	//모든 정보를 가져오는 메서드list 알규먼트로(시작값, 끝값)

	
%>

<table width = "500" align = 'center' border = "0" class="table table-striped">
	<tr>
		<td width = "100" align = 'center'>번  호</td>
		<td width = "100" align = 'center'>제  목</td>
		<td width = "100" align = 'center'>등 록 일</td>
		<td width = "100" align = 'center'>조 회 수</td>
	</tr>
	<%for(TestDTO dto : listDTO){ %>
	<tr>
		<td align = 'center'><%=dto.getNum() %></td>
		<td align = 'center'><a style = "text-decoration:none;color:black; " href = "readPageInclude.jsp?title=<%=dto.getTitle()%>&num=<%=dto.getNum()%>"><%=dto.getTitle() %></a></td>
		<td align = 'center'><%=dto.getPdate() %></td>
		<td align = 'center'><%=dto.getCount() %></td>
	</tr>
	<%}if(listDTO.size() ==0) out.print("<tr><td colspan = '4'>등록된 정보가 없습니다.</td></tr>"); %>
	
	<tr>
		
		<td colspan = '4' align = 'center'><%if(intStart != 1){ %>
	<button type = "button" class = "btn btn-primary btn-sm" onClick ="location.href= 'listInclude.jsp?start=<%=intStart-1%>'" >
	이전
	</button>
	<%}else{	//이전페이지가 존재하지 않을경우 %>
	<button type = "button"  disabled>
	이전
	</button>
	<%} %>
	
	<%
	int pageNum;
	if(totalPage%5 ==0){pageNum = totalPage/5;}else{pageNum=(totalPage/5+1);}
	for(int i=1; i<=pageNum;i++){ %>
		<a href = "listInclude.jsp?start=<%= i %>">[ <%= i %> ]</a>
	<%} %>
	
<%if(intStart < pageNum){ //totalPage 까지 증가하니까 그전까지는 다음 페이지로 넘어갈수있음%>
	<button type = "button" class = "btn btn-primary btn-sm" onClick ="location.href= 'listInclude.jsp?start=<%=intStart+1%>'" >
	다음
	</button>
	<%}else{	//다음 페이지가 존재하지 않을경우 %>
	<button type = "button"  disabled>
	다음
	</button>
	<%} %><br><%=Integer.parseInt(start) %>/<%=pageNum%>   <Button type = "button"  class = "btn btn-success btn-sm" onClick = "location.href = 'regInclude.jsp'">등록</Button></td>
	</tr>
</table>
</div>
</body>
</html>