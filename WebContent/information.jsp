<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="person.PersonDAO"%>
<%@ page import="person.PersonDTO"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="css/custom.css">

<title>사원정보 페이지</title>
</head>
<body>
	<a href="index.jsp"><h1>사원관리 게시판</h1></a>
	<%
		request.setCharacterEncoding( "UTF-8" );
		int listNumber = 0;
		if ( request.getParameter( "listNumber" ) != null ) {
			listNumber = Integer.parseInt( request.getParameter( "listNumber" ) );
		}

		PersonDAO personDAO = new PersonDAO();
		ArrayList<PersonDTO> personList = personDAO.info( listNumber );
		for ( int i = 0; i < personList.size(); i++ ) {
	%>
	<table class="registered-table">
		<tbody>
			<tr class="list-form-odd">
				<td>사원번호 :</td>
				<td><%=personList.get( i ).getPersonalCode()%></td>
			</tr>
			<tr>
				<td>이름 :</td>
				<td><%=personList.get( i ).getName()%></td>
			</tr>
			<tr class="list-form-odd">
				<td>부서 :</td>
				<td><%=personList.get( i ).getDepartment()%></td>
			</tr>
			<tr>
				<td>전화번호 :</td>
				<td><%=personList.get( i ).getPhoneNumber()%></td>
			</tr>
			<tr class="list-form-odd">
				<td>이메일 :</td>
				<td><%=personList.get( i ).getEmail()%></td>
			</tr>
			<tr>
				<td>주소 :</td>
				<td><%=personList.get( i ).getAddress()%></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
	<div class="register-form">
		<input type="button" class="button" value="수정" onclick="location.href='update.jsp?listNumber=<%=listNumber%>';"> <input type="button" class="button" value="삭제" onclick="location.href='deleteAction.jsp?listNumber=<%=listNumber%>';">
	</div>
</body>
</html>