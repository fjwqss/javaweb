<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>回收站</title>
</head>
<body>
 <table border="1" >
	<tr><td>书名<td>作者<td>价格<td>恢复
	<jsp:useBean id="db" class="book.bookinfo" scope="page"/><!-- 导入自己的类（Javabean） -->
	
	<%!
    int i = 0;
	int rec_id = 0;
    %>
	<%
	request.setCharacterEncoding("gb2312");
	// 获取已删除的书籍信息的id
	String id=request.getParameter("id");
	i=db.executeUpdate("delete from book_info where id="+id);
	ResultSet rec_info = db.executeQuery("select * from recycleinfo");
	if(i==1)
		{
		//tablename:  recycleinfo
		//fieilds -column: id,recycleinfo
		// 向回收信息表中加入已删除的书籍信息的id
		  int de_sql = db.executeUpdate("insert into recycleinfo(id) values(i)");
		// 遍历回收信息表中已经存在的删除的书籍信息的id
		  ResultSet de_rs = db.executeQuery("select * from recycleinfo where id");
		  while(de_rs.next()){
			rec_id = rec_info.getInt(1);
			out.println("<tr><td>"+de_rs.getString(2)+"</td><td>"+de_rs.getString(3)+"</td><td>"+de_rs.getString(4)+"</td><td><a href='del.jsp?id="+rec_id+"'>恢复</a></td></tr>");
		  }
		}else{
			out.println("<script language='javaScript'> alert('数据库内部错误，信息回收失败！');</script>");
		 };
     db.close();
	%>
	</table>
</body>
</html>