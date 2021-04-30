<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="keyword.KeywordDAO" %>
    <%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%    
KeywordDAO dao=new KeywordDAO();//dao 인스턴스를 만들고
String keyword=request.getParameter("search");//사용자가 입력한 키워드를
List<String> items=dao.list(keyword);
for(String str:items){
	out.println(str+"<br>");
}
%>

</body>
</html>