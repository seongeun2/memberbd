<%@page import="member.memDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<%request.setCharacterEncoding("euc-kr");%>
<%String boardid = request.getParameter("boardid");
	if(boardid == null) boardid="1";%>
<%
	List articleList = null;
	memDAO dbPro = memDAO.getInstance();
	count = dbPro.getArticleCount(boardid);
	if(count > 0){
		articleList = dbPro.getArticles(startRow, endRow);}
			number=count - (currentPage-1)*pageSize;
%>
<title>Insert title here</title>
</head>
<body>

<p class="w3-left" style="padding-left: 30px;">
</p>
<div class="w3-container">
	<span class="w3-center w3-large">
		<%-- <h3>(전체글:<%=count %>)</h3> --%>
	</span>
	<p class="w3-right w3-padding-right-large"><a href="writeForm.jsp">글쓰기</a></p>
	<%-- <%
		if(count==0){				
	%> --%>
	<table class="table-bordered" width="700">
		<tr class="w3-grey">
			<td align="center">게시판에 저장된 글이 없습니다.</td>
	</table>
	<%-- <%} else { %> --%>
	<table class="w3-table-all" width="700">
		<tr class="w3-babypink" style="background-color:rgba(255, 0, 0, 0.4);">
			<td align="center" width="50">번호</td>
			<td align="center" width="250">ID</td>
			<td align="center" width="100">이름</td>
			<td align="center" width="150">생년월일</td>
			<td align="center" width="150">가입일</td>
			<td align="center" width="150">회원등급</td>
			<%
			
			for(int i=0; i<articleList.size(); i++){
				BoardDataBean article = (BoardDataBean) articleList.get(i);%>
				<tr  table class="w3-container w3-light-gray w3-hover-pale-red" style="height:30">
				<td align="center" width="50"><%=number-- %></td>	<!-- 번호 -->
				<td width="250"><!-- 제목 -->
				<%int wid=0;
					if(article.getRe_level()>0){
						wid=5*(article.getRe_level());
				%><img src="../images/level.gif" width="<%=wid%>" height="16"><img src="../images/re.gif">
				<%}else{
				%><img src="../images/level.gif" width="<%=wid%>" height="16">
				<%}%><a href="content.jsp?num=<%=article.getNum() %>&pageNume=<%=currentPage %>">
				<%=article.getSubject() %></a><%
					if(article.getReadcount()>=20){
						%><img src="../images/hot.gif" border="0" height="16"><%}%></td>
				<td align="center" width="100"><%=article.getWriter() %></td>
				<td align="center" width="150"><%=sdf.format(article.getReg_date()) %></td>
				<td align="center" width="50"><%=article.getReadcount() %></td>
				<td align="center" width="100"><%=article.getIp() %></td>
		</tr><%} %>	
	</table>
<%-- 	<% 
	}
	%> --%>
<div class="w3-center">
<%int bottomLine=3;
	if(count>0){int pageCount=count/pageSize+(count%pageSize==0?0:1);
	int startPage = 1+(currentPage-1)/bottomLine*bottomLine;
	int endPage = startPage+bottomLine-1;
	if(endPage>pageCount) endPage=pageCount;
	if(startPage>bottomLine){	%>
	<a href="list.jsp?pageNum=<%=startPage-bottomLine %>">[이전]</a>
	<%} %>
	<%for (int i=startPage; i<=endPage; i++){ %>
	<a href="list.jsp?pageNum=<%=i%>"><%
		if(i!=currentPage) out.print("["+i+"]");
		else out.print("<font color='red'>["+i+"]</font>");	%></a>
	<%}
		if(endPage<pageCount){ %>
		<a href="list.jsp?pageNum=<%=startPage+bottomLine%>">[다음]</a>
		<%}	} %>
</div>
</div>
</body>
</html>