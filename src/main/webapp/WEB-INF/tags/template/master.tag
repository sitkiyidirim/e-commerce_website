<%@ tag body-content="scriptless" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ attribute name="pageTitle" required="false"%>

<!DOCTYPE html>
<html lang="tr">
<head> 
	<title>${pageTitle}</title>

	<%-- Meta Content --%>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="google-site-verification" content="QfHe7z90-ioetxbg97fu5oGJspNRqg0pBDIqLBlK4Y0" />
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link rel="shortcut icon" type="image/x-icon" media="all" href="/_ui/shared/images/favicon.ico">
	
	<template:style/>
 
</head>

<body>

 
<jsp:doBody/>

 
<template:javascript/>


</body>

</html>
