<%@ include file="/WEB-INF/jsp/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
$(function() {
$("#modify").click(function(){		
	var status = $("#id_deferral_status").val(); 
	var studentNumber='${deferralwrapper.studentNumber}';	
	var url="/deferral/modifyDeferral/id/"+ studentNumber + "/status/"+status;
	location.href="<%= request.getContextPath() %>"+url;
});
});
</script>
</head>

<body>
<h2>${message}</h2>
	<form:form modelAttribute="deferralwrapper">

		<div class="ui-field-contain">
			<form:label path="firstName">FirstName</form:label>
			<form:input path="firstName" value="${deferralwrapper.firstName}"
				disabled="true" />
		</div>
		<div class="ui-field-contain">
			<form:label path="lastName">LastName</form:label>
			<form:input path="lastName" value="${deferralwrapper.lastName}"
				disabled="true" />
		</div>
		<div class="ui-field-contain">
			<form:label path="studentNumber">student number</form:label>
			<form:input path="studentNumber" value="${deferralwrapper.studentNumber}"
				disabled="true" />
		</div>
		<div class="ui-field-contain">
			<form:label path="id_program">program id</form:label>
			<form:input path="id_program" value="${deferralwrapper.id_program}"
				disabled="true" />
		</div>
		<div class="ui-field-contain">
			<form:label path="deferral_date">date</form:label>
			<form:input path="deferral_date" value="${deferralwrapper.deferral_date}"
			disabled="true" />
		</div>
		<div class="ui-field-contain">
			<form:label path="id_deferral_status">status</form:label>
			<form:input path="id_deferral_status" value="${deferralwrapper.id_deferral_status}"/>
		</div>
		<input type="button" class="ui-btn" data-theme="b" data-icon="check"
			value="Modify" id="modify" />
	</form:form>
</body>
</html>  