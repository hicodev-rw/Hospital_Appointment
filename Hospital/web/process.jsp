<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="rmhospital.user.RegisterDao"%>
<jsp:useBean id="obj" class="rmhospital.bean.User" />
<jsp:setProperty property="*" name="obj" />
<%
	int status = RegisterDao.register(obj);
	if (status > 0){
            %>
        
<script type="text/javascript">
    alert("Form has been submitted");
</script>
<% } 
response.sendRedirect("index.jsp");
%>

