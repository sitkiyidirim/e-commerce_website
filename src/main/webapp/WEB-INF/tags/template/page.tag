<%@ attribute name="pageTitle" required="false" rtexprvalue="true"%>

<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="header" tagdir="/WEB-INF/tags/common/header"%>
<%@ taglib prefix="footer" tagdir="/WEB-INF/tags/common/footer"%>

<template:master pageTitle="${pageTitle}">

	<jsp:body>
		<main>
			<header:header />
			
			<a id="skip-to-content"></a>
			
			<jsp:doBody />
			 
			<footer:footer /> 
		</main>
	</jsp:body>
</template:master>
