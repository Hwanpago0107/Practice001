<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="person.PersonDAO"%>
<%@ page import="person.PersonDTO"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="css/custom.css">

<title>사원정보 수정 페이지</title>
</head>
<body>
	<%
		request.setCharacterEncoding( "UTF-8" );
		int listNumber = 0;
		if ( request.getParameter( "listNumber" ) != null ) {
			listNumber = Integer.parseInt( request.getParameter( "listNumber" ) );
		}
	%>

	<a href="index.jsp"><h1>사원관리 게시판</h1></a>

	<form method="post" action="updateAction.jsp?listNumber=<%=listNumber%>">

		<table class="table-form">
			<tbody>
				<tr class="list-form-odd">
					<td class="list-form">사원번호 :</td>
					<td><input type="text" class="text-form" placeholder="사원번호" name="personalCode" maxlength="200"></td>
				</tr>
				<tr>
					<td>이름 :</td>
					<td><input type="text" class="text-form" placeholder="이름" name="name" maxlength="200"></td>
				</tr>
				<tr class="list-form-odd">
					<td>부서 :</td>
					<td><input type="text" class="text-form" placeholder="부서" name="department" maxlength="200"></td>
				</tr>
				<tr>
					<td>전화번호 :</td>
					<td><input type="text" class="text-form" placeholder="전화번호" name="phoneNumber" maxlength="200"></td>
				</tr>
				<tr class="list-form-odd">
					<td>이메일 :</td>
					<td><input type="text" class="text-form" placeholder="이메일" name="email" maxlength="200"></td>
				</tr>
				<tr>
					<td>주소 :</td>
					<td><input type="text" class="text-form" placeholder="주소" name="address" maxlength="200"></td>
				</tr>
			</tbody>
		</table>
		<div class="register-form">
			<input type="submit" class="button" value="수정">
		</div>
	</form>

</body>
</html>