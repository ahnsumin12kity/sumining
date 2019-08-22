<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="board.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="color.jspf" %>

<%!
int pageSize=10;
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<%

String pageNum=request.getParameter("pagNum");
if(pageNum == null){
pageNum = "1";

}

 

int currPage=Integer.parseInt(pageNum);
int startRow = (currPage-1) * pageSize +1;
int endRow = currPage * pageSize ;
int count = 0 ;
int number = 0;

List<BoardDataBean> articleList = null ;
BoardDBBean dbPro = BoardDBBean.getInstance();
count = dbPro.getArticleCount();

if( count > 0 ){

articleList = dbPro.getArticles(startRow, endRow);

}

number = count - (currPage - 1) * pageSize ; 

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판리스트</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="<%=bodyback_c%>">
<p>글목록(전체 글 : <%= count %>)</p>

 

<table>
<tr>
<td align="right" bgcolor="<%= value_c%>">
<a href="writeForm.jsp">글쓰기</a>
</td>
</tr>
</table>
<% if (count == 0) { %>
<table>
<tr>
<td align="center">게시판에 저장된 글이 없습니다.</td>
</tr>
</table>
<% } else { %>
<table>
<tr height="30" bgcolor="<%= value_c%>">
<td align="center" width="50">번호 </td>
<td align="center" width="250">제 목</td>
<td align="center" width="100">작성자</td>
<td align="center" width="150">작성일</td>
<td align="center" width="50">조 회</td>
<td align="center" width="100">IP</td>
</tr>
<%

for(int i = 0 ; i < articleList.size(); i++){
BoardDataBean article = articleList.get(i);
%>

<tr height="30">
<td width="50"><%= number-- %></td>
<td width="250" align="left">
<%
int wid = 0;
if(article.getReLevel() > 0){
wid = 5 * (article.getReLevel());
%>
<img src = "image/level.png" width="<%= wid%>" height="16">
<img src = "image/re.png">
<%
} else {
%>
<img src = "image/level.png" width="<%= wid%>" height="16">
<%

}
%>
<%= article.getSubject() %>
</td>
<td width="100"><%= article.getWriter() %></td>
<td width="150"><%= sdf.format(article.getRegDate()) %></td>
<td width="50"><%= article.getReadCount() %></td>
<td width="100"><%= article.getIp() %></td>
</tr>

<% } %>
</table>
<% } %>

</body>

</html>