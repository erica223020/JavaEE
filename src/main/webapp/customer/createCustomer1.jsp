<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增顧客</title>
<link href="<%= request.getContextPath() %>/style/myStyle.css" rel="stylesheet"/>
</head>
<body>
	<h2>新增顧客(1)</h2>
	<%--Start Error Report --%>
	<% LinkedList<String> errors = (LinkedList<String>)request.getAttribute("errors");%>
	<% if(errors != null){ %>
		<ul style="color: red; font-size: 1em">
		<table border="0" style="margin: auto;text-align:left">
			<%for(String error: errors){%>
				<tr><td><li><%= error %></li></td></tr>
			<%}%>
		</table>
		</ul>
	<%} %>
	
	<%--End Error Report --%>
	
	<form action="createCustomer.do" method="post">
		<input type="hidden" name="action" value="cc1"/>
		<table border="0" style="margin: auto; text-align: left">
			<tbody>
				<tr>
					<td>姓名</td><td><input type="text" name="name" value="${ param.name }"/></td>
				</tr>
				<tr>
					<td>電郵</td><td><input type="email" name="email" value="${ param.email }"/></td>
				</tr>
				<tr>
					<td>電話</td><td><input type="text" name="telephone" value="${ param.telephone }"/></td>
				</tr>
				<tr>
					<td>地址</td><td><input type="text" name="address" size="60" value="${ param.address }"/></td>
				</tr>
				<tr>
					<td></td>
				<td>
					<input type="reset" value="重設"></input>
					<input type="submit" value="送出"></input>
				</td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>