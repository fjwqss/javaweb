<%@ page language="java" isErrorPage="true" pageEncoding="gb2312"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
     <title>错误页面</title>
  </head>
  <body>
  错误信息为：
<%=exception.getMessage()%><br>
<%=exception.toString()%>
 
  </body>
</html>
