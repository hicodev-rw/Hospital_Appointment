<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="rmhospital.department.*"%>
<jsp:useBean id="obj" class="rmhospital.bean.Department" />
<jsp:setProperty property="*" name="obj" />
<%
	int status = EditDepartmentInformation.update(obj);
	response.sendRedirect("department.jsp");
%>
