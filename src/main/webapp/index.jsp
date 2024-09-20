<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
<link href="style/myStyle.css" rel="stylesheet"/>
</head>
<body>
	<h1>Welcome To My Java EE Playground!!</h1>
	<p>Current Time is : <%= SimpleDateFormat.getInstance().format(new Date()) %></p>
	<p><a href="admin/hello.aspx">Hello Servlet</a></p> <!--不要../myWeb/admin/hello.aspx (未來myWeb可能改)這邊相對路徑較佳-->
	<p><a href="admin/dump.view">Dump Servlet</a></p>
	<p><a href="admin/dump.jsp">Dump JSP</a></p>
	<p><a href="customer/createCustomer.jsp">新增顧客</a></p>
	<p><a href="customer/createCustomer1.jsp">測試交談時期</a></p>
</body>
</html>