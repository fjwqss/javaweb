<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>修改图书</title>
</head>
<body>
  <jsp:useBean id="db" class="book.bookinfo" scope="page"/>
  <%
  request.setCharacterEncoding("gb2312");
  String id=request.getParameter("id");
  ResultSet rs=db.executeQuery("select * from book_info where id="+id);
  rs.next();
   %>
   <form action="update.jsp" method="post">
     <table border="1" width="50%"  >
	  <CAPTION>修改图书信息</CAPTION>
	  <tr>
	        <th width="30%">书名：</th>
               <td width="70%">
               <input name="bookname" type="text" value="<%=rs.getString(2)%>"></td>
           </tr>
	  <tr>
	    <th>作者：</th>
	    <td><input name="author" type="text" value="<%=rs.getString(3)%>"></td>
	  </tr>
	  <tr>
	    <th>价格：</th>
	    <td><input name="price" type="text" value="<%=rs.getString(4)%>">元</td>
	  </tr>
	  <tr>
	    <th colspan="2">
	    <input type="hidden" name="id" value="<%=id%>">
	    <input type="submit" value="修改">
	    <input type="reset" value="重置">
	    </th>
	  </tr>
	</table>
</form>
<%
  db.close();
 %>
</body>
</html>
