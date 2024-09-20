<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dump JSP</title>
<link href="<%= request.getContextPath() %>/style/myStyle.css" rel="stylesheet"/>
</head>
<body>
	<h2>Dump JSP</h2>
	<%= session.isNew() %><br/>
	<%= session.getId() %><br/>
	<%= new Date(session.getLastAccessedTime())%><br/>
	<%= new Date(session.getCreationTime()) %><br/>
	<%= session.getCreationTime()%><br/>
	<%= session.getMaxInactiveInterval() %><br/>
	
	<img src="../images/KMN.jpg" width="50%">
	<table border="1" style="margin:auto">
	<tr>
	<%	for(int i = 1; i <= 9; i++){%>
		<tr>
			<% for(int j = 1; j <= 9; j++){ %>
				<td><%=i%>*<%=j%>=<%=i*j%></td>
			<%}%>
		</tr>
	<%}%>
	</tr>
	</table>
	
	<table border="1" style="margin:auto">
		<tr>
			<th>Header Name</th>
			<th>Header Value</th>
		</tr>
		<tbody>
				<% java.util.Enumeration<String> headerNames = request.getHeaderNames();
			while(headerNames.hasMoreElements()) {
			String headerName = headerNames.nextElement();
			String headerValue = request.getHeader(headerName);%>
       		<tr>
            <td><%= headerName %></td>
            <td><%= headerValue %></td>
        </tr>
        <% } %>
		</tbody>
	</table>
	<% session.invalidate(); %>
	<br/>
	<a href="../">Go Home</a>
</body>
</html>