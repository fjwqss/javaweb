<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>统计</title>
</head>
<body>
<jsp:include page="topbar.jsp"></jsp:include>
<jsp:useBean id="db" class="book.bookinfo" scope="page"/>
<ul>
<%
String s="Select count(*) From book_info where isdel=0";
ResultSet rs=db.executeQuery(s);
rs.next();
int id=rs.getInt(1);
out.println("<li>本图书馆有" + id + "本书。");
rs.close();
%>

<%
String s2="Select sum(price) From book_info where isdel=0";
ResultSet rs2=db.executeQuery(s2);
rs2.next();
int zs=rs2.getInt(1);
out.println("<li>本图书馆图书总价为" + zs + "    元。");
rs2.close();
%>

</ul>
</body>
</html>