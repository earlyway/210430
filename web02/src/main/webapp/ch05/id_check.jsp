<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="member.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String id=request.getParameter("id");
idDAO dao=new idDAO();
idDTO dto=new idDTO();
dto.setBasicid(id);
//out.println(dto);
String result=dao.login(dto);
//out.println("result:"+result);
if(result == null){ //SQL 테이블 안의 입력값이 존재하는지 안하는지로 판별.
	//out.println(request.getParameter("basicid")+"사용불가");
	out.println("사용 가능한 아이디입니다.");
}else{
	out.println(result+"사용할 수 없는 아이디입니다.");
}
%>

</body>
</html>