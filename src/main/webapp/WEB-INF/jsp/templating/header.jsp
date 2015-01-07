<%@ include file="/WEB-INF/jsp/include.jsp"%>
<html>

<head>
<title>Header</title>
<link href="<c:url value="/resources/css/citonline.css" />" rel="stylesheet">
</head>
<body>
	<h1>CIT Online</h1> 
	<c:url var="url" value="/j_spring_security_logout"></c:url>  
	<a href="<%= request.getContextPath() %>/home" class="ui-btn ui-icon-home ui-btn-icon-left">Home</a>
	<security:authorize access="isFullyAuthenticated()">
		<a href="${url}" class="ui-btn ui-icon-search ui-btn-icon-left">Logout</a>
	</security:authorize>
	<security:authorize access="isAnonymous()">
		<a href="${url}" class="ui-btn ui-icon-search ui-btn-icon-left">Login</a>
	</security:authorize>
	

	<div data-role="navbar">
    	<ul>
	        <li><a href="#">Lecturer</a></li>
	        <li><a href="#">Student</a></li>
	        <li><a href="#">Deferral</a></li>
    	</ul>
    </div>

</body>
</html>