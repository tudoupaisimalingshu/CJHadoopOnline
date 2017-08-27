<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.util.*"
    pageEncoding="UTF-8"%>
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hadoop</title>
</head>
<body>
		<h1>文件上传</h1><br>
	<form name="userForm" action="<%=basePath %>hadoop/upload"  method="post" enctype="multipart/form-data" >
		选择文件：<input type="file" name="file">
		<input type="submit" value="上传"><br>
	</form>
	<a href="<%=basePath %>hadoop/wordcount">提交任务</a>
	<%
		List<String> fileList =(List<String>) session.getAttribute("fileList");
		out.println("<table>");
		out.println("<tr><td>文件路径</td></tr>");
		if(fileList!=null)
		for(String file : fileList)
		{
			out.println("<tr>");
			out.println("<td>");
			out.println(file);
			out.println("</td>");
		}
		out.println("</table>");
	%>
</body>
</html>