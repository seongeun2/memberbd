<%@page import="member.memDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
int num = Integer.parseInt(request.getParameter("num")); //deleteForm 에서 넘어온 데이터
System.out.println("넘값은 ㅜㅜ"+num);
String passwd = request.getParameter("m_pwd");
System.out.println("비밀번호는?? ㅜㅜ"+passwd);
memDAO dao = memDAO.getInstance();
int passcheck = dao.deleteMember(num, passwd);
System.out.println("이값은뭐지"+passcheck);
if(passcheck == 1){
	
%><meta http-equiv = "Refresh" content="0;url=list.jsp?">
<%}else{ %>
<script type="text/javascript">
alert("비밀번호가 맞지 않습니다");
history.go(-1);
</script><%} %> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>