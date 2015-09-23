<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<!-- Success message (alert-short) -->
<c:if test="${success != null}">
	<div class="alert alert-success alert-short text-center prompt" role="alert">
		<span class="glyphicon glyphicon-ok-sign" aria-hidden="true"></span>
		<span class="sr-only">Message:</span>${success}
	</div>
</c:if>
<!-- Success message (alert-long) -->
<c:if test="${success_long != null}">
	<div class="alert alert-success alert-long text-center prompt" role="alert">
		<span class="glyphicon glyphicon-ok-sign" aria-hidden="true"></span>
		<span class="sr-only">Message:</span>${success_long}
	</div>
</c:if>
<!-- Error message (alert-normal) -->
<c:if test="${error != null}">
<div class="alert alert-danger alert-normal text-center prompt" role="alert">
	<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
	<span class="sr-only">Error:</span>${error}
</div>
</c:if>
</body>
</html>