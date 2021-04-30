<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %> <!-- page 지시어 -->
<%
String driver="com.mysql.jdbc.Driver";
String url="jdbc:mysql://localhost/mydb";//연결문자열
String id="java";
String pwd="java1234";

Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs=null;

try {
conn=DriverManager.getConnection(url,id,pwd);
String sql="select * from score_v";
pstmt=conn.prepareStatement(sql);
rs=pstmt.executeQuery();
%>
<table border="1">
	<tr> 	<!-- table row테이블의 행 -->
		<td>학번</td><!-- table divsion 테이블의 열 -->
		<td>이름</td>
		<td>국어</td>
		<td>영어</td>
		<td>수학</td>
		<td>총점</td>
		<td>평균</td>
		<td>등급</td>
		</tr>
<%
while(rs.next()) {//1개의 레코드를 읽음, 내용이 있으면 true, 없으면 false
int student_no=rs.getInt("student_no");//get자료형(필드명)
String name=rs.getString("name");
int kor=rs.getInt("kor");
int eng=rs.getInt("eng");
int mat=rs.getInt("mat");
int tot=rs.getInt("tot");
double avg=rs.getDouble("avg");
String grd=rs.getString("grd");
%>
	<tr>
		<td><%=student_no%></td>
		<td><%=name%></td>
		<td><%=kor%></td>
		<td><%=eng%></td>
		<td><%=mat%></td>
		<td><%=tot%></td>
		<td><%=avg%></td>
		<td><%=grd%></td>
	</tr>
<%
}
} catch (Exception e) {
e.printStackTrace();
}finally {
try {
if(rs!=null) rs.close();//참조변수가 'rs가 가리키는 내용'이 null이 아니면 close()
} catch (Exception e) {
e.printStackTrace();
}
try {
if(pstmt!=null) pstmt.close();
} catch (Exception e) {
e.printStackTrace();
}
try {
if(conn!=null) conn.close();
} catch (Exception e) {
e.printStackTrace();
}
}
%>
</table>
</body>
</html>