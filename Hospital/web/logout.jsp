<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	session.removeAttribute("adminuname");
	response.sendRedirect("index.jsp");
%>