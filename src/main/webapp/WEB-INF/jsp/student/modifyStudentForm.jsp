<%@ include file="/WEB-INF/jsp/include.jsp"%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
$(function() {
$("#modify").click(function(){		
	var id=${student.id};
	var firstName=$("#firstName").val(); 
	var lastName=$("#lastName").val(); 
	var studentNumber=$("#studentNumber").val(); 
	var email=$("#email").val(); 
	var phoneNumber=$("#phoneNumber").val(); 
	var addressLine1=$("#addressLine1").val(); 
	var addressLine2=$("#addressLine2").val(); 
	var url="/student/modifyStudentForm/id/"+id+"/firstName/"+firstName+"/lastName/"+lastName+"/studentNumber/"+studentNumber+
	"/email/"+email+"/phoneNumber/"+phoneNumber+"/addressLine1/"+addressLine1+"/addressLine2/"+addressLine2;
	location.href="<%= request.getContextPath() %>"+url;
});
});
</script>
</head>

<body>
	<form:form modelAttribute="student">

		<div class="ui-field-contain">
			<form:label path="firstName">FirstName</form:label>
			<form:input path="firstName" value="${student.firstName}" />
		</div>
		
		<div class="ui-field-contain">
			<form:label path="lastName">LastName</form:label>
			<form:input path="lastName" value="${student.lastName}"/>
		</div>
		
		<div class="ui-field-contain">
			<form:label path="studentNumber">Student number</form:label>
			<form:input path="studentNumber" value="${student.studentNumber}"/>
		</div>	
		
		<div class="ui-field-contain">
			<form:label path="email">Email</form:label>
			<form:input path="email" value="${student.lastName}"/>
		</div>
		
		<div class="ui-field-contain">
			<form:label path="phoneNumber">Phone number</form:label>
			<form:input path="phoneNumber" value="${student.phoneNumber}"/>
		</div>	
		
		<div class="ui-field-contain">
			<form:label path="addressLine1">Address1</form:label>
			<form:input path="addressLine1" value="${student.addressLine1}"/>
		</div>	
		
		<div class="ui-field-contain">
			<form:label path="addressLine2">Address2</form:label>
			<form:input path="addressLine2" value="${student.addressLine2}"/>
		</div>	
		
		<input type="button" class="ui-btn" data-theme="b" data-icon="check"
			value="Modify" id="modify" />
	</form:form>
</body>
</html>  