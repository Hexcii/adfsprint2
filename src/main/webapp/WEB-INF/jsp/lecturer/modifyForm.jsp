<%@ include file="/WEB-INF/jsp/include.jsp"%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
$(function() {
$("#modify").click(function(){		
	var age = $("#age").val(); 
	var lecturerId=${lecturer.id};	
	var url="/lecturer/modify/id/"+lecturerId+"/age/"+age;
	location.href="<%= request.getContextPath() %>"+url;
});
});
</script>
</head>

<body>
	<form:form modelAttribute="lecturer">

		<div class="ui-field-contain">
			<form:label path="firstName">FirstName</form:label>
			<form:input path="firstName" value="${lecturer.firstName}"
				disabled="true" />
		</div>
		<div class="ui-field-contain">
			<form:label path="lastName">LastName</form:label>
			<form:input path="lastName" value="${lecturer.lastName}"
				disabled="true" />
		</div>
		<div class="ui-field-contain">
			<form:label path="email">Email</form:label>
			<form:input path="email" value="${lecturer.lastName}"
				disabled="true" />
		</div>
		<div class="ui-field-contain">
			<form:label path="phoneNumber">Phone number</form:label>
			<form:input path="phoneNumber" value="${lecturer.phoneNumber}"/>
		</div>
		<div class="ui-field-contain">
			<form:label path="roomNumber">Room number</form:label>
			<form:input path="roomNumber" value="${lecturer.roomNumber}"/>
		</div>
		<div class="ui-field-contain">
			<form:label path="idManagedProgram">Managed Program ID</form:label>
			<form:input path="idManagedProgram" value="${lecturer.idManagedProgram}"/>
		</div>
		<div class="ui-field-contain">
		<form:label path="taughModules">Taught modules</form:label>
		<c:forEach var="module" items="${lecturer.taughtModules}" varStatus="status">
			<tr>
				<td>${module.name}</td>
			</tr>
		</c:forEach>
		<form:label path="IdNewTaughModule">Add taught modules</form:label>
		<form:input path="IdNewTaughModule" value=""/>
		</div>
		
		<input type="button" class="ui-btn" data-theme="b" data-icon="check"
			value="Modify" id="modify" />
	</form:form>
</body>
</html>  