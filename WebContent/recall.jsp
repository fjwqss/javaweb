<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>恢复图书</title>
</head>
<body>
  <jsp:useBean id="db" class="book.bookinfo" scope="page"/>
	<%
	request.setCharacterEncoding("gb2312");
	
	String id=request.getParameter("id");
	int i=db.executeUpdate("update book_info set isdel=0 where id="+id);
	if(i==1)
		{out.println("<script language='javaScript'> alert('恢复成功，点击确定后自动跳到主页！');</script>");
		response.setHeader("refresh","1;url=index.jsp");
		}
	else{
		out.println("<script language='javaScript'> alert('恢复失败，点击确定后自动跳到主页！');</script>");
		response.setHeader("refresh","1;url=del.jsp");
	}
     db.close();
	%>
</body>
</html>