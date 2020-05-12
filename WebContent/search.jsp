<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<title>搜索结果</title>
</head>
<body>
<jsp:include page="topbar.jsp"></jsp:include>

|
  <form action="search.jsp">
  <input type=text size=10 name=skey>
  <input type=submit value="检索">
  </form>
  <p>
  
	<table border="1" >
	<tr><td>书名<td>作者<td>价格<td>管理
	<jsp:useBean id="db" class="book.bookinfo" scope="page"/><!-- 导入自己的类（Javabean） -->
	<%
	request.setCharacterEncoding("gb2312");
	String skey2=request.getParameter("skey");
	String s="select * from book_info where bookname like '%"+skey2+"%' and isdel=0";
	//out.println("sql："+s);
	ResultSet rs=db.executeQuery(s);
	//rs.next();
	while(rs.next())
	{
		int id=rs.getInt(1);
		out.println("<tr><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td><a href='del.jsp?id="+id+"'>删除</a>&nbsp;<a href='edit.jsp?id="+id+"'>修改</a></td></tr>");
	}
	rs.close();
	db.close();
	%>
	</table>
</body>
</html>