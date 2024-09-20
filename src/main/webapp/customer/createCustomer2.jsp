<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Successful</title>
<link href="<%= request.getContextPath() %>/style/myStyle.css" rel="stylesheet"/>
</head>
<body>
	<h2>建立顧客資料</h2>
	<form action="ccController.do" method="post">
	<input type="hidden" name="action" value="cc2"/>
		<table border="0" style="margin: auto; text-align: left">
			<tbody>
				<tr>
					<td>生日</td><td><input type="date" name="birth" value="${ param.birth }"/></td>
				</tr>
				<tr>
					<td>性別</td>
					<td>
						<% 
						String isMale = "";
						String isFemale = "";
						String gender = request.getParameter("gender");
						if(gender != null) {
							if(gender.equals("male")){
								isMale = "checked";
							}else{
								isFemale = "checked";
							}
						}
						%>
						<input type="radio" name="gender" value="male" <%= isMale %>/>男
						<input type="radio" name="gender" value="female" <%= isFemale %>/>女
					</td>
				</tr>
				<tr>
					<td>嗜好</td>
					<td>
						<% 
						String musicSelected = "";
						String shoppingSelected = "";
						String readingSelected = "";
						String[] habit = request.getParameterValues("habit");
						if(habit != null) {
							for(String habitStirng:habit)
							if(habitStirng.equals("music")){
								musicSelected = "checked";
							}else if (habitStirng.equals("shopping")){
								shoppingSelected = "checked";
							}else if (habitStirng.equals("reading")) {
								readingSelected = "checked";
							} 
						}
						
						%>
						<input type="checkbox" name="habit" value="music" <%= musicSelected %>/>聽音樂
						<input type="checkbox" name="habit" value="shopping" <%= shoppingSelected %>/>逛大街
						<input type="checkbox" name="habit" value="reading"<%= readingSelected %>/>讀好書
					</td>
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
	<br/>
	<a href="../">Go Home</a>

</body>
</html>