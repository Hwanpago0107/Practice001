<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="person.PersonDTO"%>
<%@ page import="person.PersonDAO"%>
<%@ page import="java.util.ArrayList"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-Type" content="text/html; charset=UTF-8">
<title>게시판 웹사이트</title>
</head>
<body>
	<%
		int listNumber = 0;
		if (request.getParameter("listNumber") != null) {
			listNumber = Integer.parseInt(request.getParameter("listNumber"));
		}
		PersonDAO personDAO = new PersonDAO();
		int result = personDAO.delete(listNumber);
	%>

	<script>
		location.href = 'index.jsp'
	</script>
</body>
</html>