<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="person.PersonDAO"%>
<%@ page import="person.PersonDTO"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="css/custom.css">

<title>사원관리 게시판</title>

</head>
<body>
	<%
		request.setCharacterEncoding( "UTF-8" );
		int pageNumber = 1;
		if ( request.getParameter( "pageNumber" ) != null ) {
			pageNumber = Integer.parseInt( request.getParameter( "pageNumber" ) );
		}
	%>

	<a href="index.jsp"><h1>사원관리 게시판</h1></a>

	<form method="get" action="./index.jsp" class="form">
		<div class="buttons">
			<input type="button" class="button" value="등록" onclick="location.href='register.jsp';">
		</div>
	</form>
	<table>
		<tr>
			<th class="index-form" width="50">번호</th>
			<th class="index-form" width="150">사원번호</th>
			<th class="index-form" width="100">이름</th>
			<th class="index-form" width="150">부서</th>
			<th class="index-form" width="150">전화번호</th>
			<th class="index-form" width="200">이메일</th>
			<th class="index-form" width="300">주소</th>
		</tr>

		<%
			PersonDAO personDAO = new PersonDAO();
			ArrayList<PersonDTO> list = personDAO.getList( pageNumber );
			for ( int i = 0; i < list.size(); i++ ) {
		%>
		<tr>
			<th class="index-form" width="50"><%=list.get( i ).getListNumber()%></th>
			<th class="index-form" width="150"><a href="information.jsp?listNumber=<%=list.get( i ).getListNumber()%>"><%=list.get( i ).getPersonalCode()%></a></th>
			<th class="index-form" width="100"><a href="information.jsp?listNumber=<%=list.get( i ).getListNumber()%>"> <%=list.get( i ).getName()%></a></th>
			<th class="index-form" width="150"><%=list.get( i ).getDepartment()%></th>
			<th class="index-form" width="150"><%=list.get( i ).getPhoneNumber()%></th>
			<th class="index-form" width="200"><%=list.get( i ).getEmail()%></th>
			<th class="index-form" width="300"><%=list.get( i ).getAddress()%></th>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>