<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>增加图书</title>
</head>
<body>
<jsp:include page="topbar.jsp"></jsp:include>
  <form action="add.jsp" method="post">
<table >
<CAPTION>添加图书信息</CAPTION>
  <tr>
    <th width="30%">书名：</th>
    <td width="70%"><input name="bookname" type="text"></td>
  </tr>
  <tr>
    <th>作者：</th>
    <td><input name="author" type="text"></td>
  </tr>
  <tr>
    <th>价格：</th>
    <td><input name="price" type="text">元</td>
  </tr>
  <tr>
    <th colspan="2">
    <input type="submit" name="submit" value="添加">
    <input type="reset" value="重置">
    </th>
  </tr>
</table>
</form>
<jsp:useBean id="db" class="book.bookinfo" scope="page"/>
<%
request.setCharacterEncoding("gb2312");
String submit=request.getParameter("submit");
if(submit!=null&&!submit.equals(""))
{
	String  bookname=request.getParameter("bookname");
	String  author=request.getParameter("author");
	String  price=request.getParameter("price");
	String sql="insert into book_info(bookname,author,price) values('"+bookname+"','"+author+"',"+price+")";
	int i=db.executeUpdate(sql);
	if(i!=-1)
	{
	out.println("<script language='javaScript'> alert('添加成功,点击确定跳转到主页!');</script>");
	response.setHeader("refresh","1;url=index.jsp");
	}
	else{
	out.println("<script language='javaScript'> alert('添加失败，点击确定返回添加页面！');</script>");
	response.setHeader("refresh","1;url=add.jsp");
	}
	db.close();
}
%>
</body>
</html>
