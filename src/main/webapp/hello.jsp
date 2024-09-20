<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error/error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%! int a = 100; %>
	<%  int a = 500; %>
	a = <%= a/0 %><br />
	Current Time is ： <%= SimpleDateFormat.getInstance().format(new Date()) %>
	<!-- HTML Comment --> 
	<%//java single line comment %> <!-- java 開發人員看 -->
	<%-- JSP Comment --%> <!-- 翻譯完會不見 -->
	User-Agent: <%= request.getHeader("User-Agent") %><br/>
	User-Agent: <% out.println(request.getHeader("User-Agent")); %><br/>
	User-Agent: ${ header.User-Agent }<br/>
	<%//Integer.parseInt((String)(session.getAttribute("abc")))*123 %>

	User-Agent:${ header.User-agent}<br/>
	User-Agent:${ header["User-Agent"]}
					<!--EL : 1.會自動搜尋(從最小開始)2.會將null自動轉型成0 -->
</body>
</html>