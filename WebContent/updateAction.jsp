<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="person.PersonDAO"%>
<%@ page import="person.PersonDTO"%>
<%
	request.setCharacterEncoding("UTF-8");
	int listNumber = 0;
	String name = null;
	String department = null;
	String personalCode = null;
	String phoneNumber = null;
	String email = null;
	String address = null;

	if (request.getParameter("listNumber") != null) {
		listNumber = Integer.parseInt(request.getParameter("listNumber"));
	}
	if (request.getParameter("name") != null) {
		name = request.getParameter("name");
	}
	if (request.getParameter("department") != null) {
		department = request.getParameter("department");
	}
	if (request.getParameter("personalCode") != null) {
		personalCode = request.getParameter("personalCode");
	}
	if (request.getParameter("phoneNumber") != null) {
		phoneNumber = request.getParameter("phoneNumber");
	}
	if (request.getParameter("email") != null) {
		email = request.getParameter("email");
	}
	if (request.getParameter("address") != null) {
		address = request.getParameter("address");
	}
	PersonDAO personDAO = new PersonDAO();
	int result = personDAO
			.update(new PersonDTO(listNumber, name, department, personalCode, phoneNumber, email, address));
%>

<script>
	location.href = 'information.jsp?listNumber=<%=listNumber%>
	'
</script>
